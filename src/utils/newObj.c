//
// Created by Jecer BEN HAMMOUDA on 26/4/2023.
//

#include <anjay/dm.h>

 int new_resource_read(anjay_t *anjay,
                              const anjay_dm_object_def_t *const *obj_ptr,
                              anjay_iid_t iid,
                              anjay_rid_t rid,
                              anjay_riid_t riid,
                              anjay_output_ctx_t *ctx) {
    // These arguments may seem superfluous now, but they will come in handy
    // while defining more complex objects
    (void) anjay;   // unused
    (void) obj_ptr; // unused: the object holds no state
    (void) iid;     // unused: will always be 0 for single-instance Objects
    (void) riid;    // unused: will always be ANJAY_ID_INVALID

    switch (rid) {
        case 0:
            return anjay_ret_string(ctx, "Test object");
        case 1:
            return anjay_ret_i64(ctx, 44);
        default:
            // control will never reach this part due to test_list_resources
            return 0;
    }
}


 int new_list_resources(anjay_t *anjay,
                               const anjay_dm_object_def_t *const *obj_ptr,
                               anjay_iid_t iid,
                               anjay_dm_resource_list_ctx_t *ctx) {
    (void) anjay;   // unused
    (void) obj_ptr; // unused
    (void) iid;     // unused

    anjay_dm_emit_res(ctx, 0, ANJAY_DM_RES_R, ANJAY_DM_RES_PRESENT);
    anjay_dm_emit_res(ctx, 1, ANJAY_DM_RES_R, ANJAY_DM_RES_PRESENT);
    return 0;
}


  anjay_dm_object_def_t OBJECT_DEF = {

        .handlers = {
                // single-instance Objects can use this pre-implemented handler:
                .list_instances = anjay_dm_list_instances_SINGLE,

                .list_resources = new_list_resources,
                .resource_read = new_resource_read

                // all other handlers can be left NULL if only Read operation is
                // required
        }
};

anjay_dm_object_def_t createNewObject(int oid){
    OBJECT_DEF.oid=oid;
    return OBJECT_DEF;
}