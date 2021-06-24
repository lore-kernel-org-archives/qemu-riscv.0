Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwN3I-0001gR-2h
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 06:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN3D-0001XY-IM; Thu, 24 Jun 2021 06:57:39 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:45166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN38-0004OM-Km; Thu, 24 Jun 2021 06:57:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0644709-0.0018413-0.933688;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKE97h_1624532248; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKE97h_1624532248)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 24 Jun 2021 18:57:28 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 02/37] target/riscv: Make the vector helper functions public
Date: Thu, 24 Jun 2021 18:54:46 +0800
Message-Id: <20210624105521.3964-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.97; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-97.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jun 2021 10:57:40 -0000

The saturate functions about add,subtract and shift functions can
be used in packed extension.Therefore hoist them up.

The endianess process macro is also be hoisted.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/internals.h     | 50 ++++++++++++++++++++++
 target/riscv/vector_helper.c | 82 +++++++++++-------------------------
 2 files changed, 74 insertions(+), 58 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b15ad394bb..698158e116 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -58,4 +58,54 @@ static inline float32 check_nanbox_s(uint64_t f)
     }
 }
 
+/*
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing units smaller than that needs a host-endian fixup.
+ */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)   ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
+#define H2(x)   ((x) ^ 3)
+#define H4(x)   ((x) ^ 1)
+#define H8(x)   ((x))
+#else
+#define H1(x)   (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
+#define H2(x)   (x)
+#define H4(x)   (x)
+#define H8(x)   (x)
+#endif
+
+/* share functions about saturation */
+int8_t sadd8(CPURISCVState *, int vxrm, int8_t, int8_t);
+int16_t sadd16(CPURISCVState *, int vxrm, int16_t, int16_t);
+int32_t sadd32(CPURISCVState *, int vxrm, int32_t, int32_t);
+int64_t sadd64(CPURISCVState *, int vxrm, int64_t, int64_t);
+
+uint8_t saddu8(CPURISCVState *, int vxrm, uint8_t, uint8_t);
+uint16_t saddu16(CPURISCVState *, int vxrm, uint16_t, uint16_t);
+uint32_t saddu32(CPURISCVState *, int vxrm, uint32_t, uint32_t);
+uint64_t saddu64(CPURISCVState *, int vxrm, uint64_t, uint64_t);
+
+int8_t ssub8(CPURISCVState *, int vxrm, int8_t, int8_t);
+int16_t ssub16(CPURISCVState *, int vxrm, int16_t, int16_t);
+int32_t ssub32(CPURISCVState *, int vxrm, int32_t, int32_t);
+int64_t ssub64(CPURISCVState *, int vxrm, int64_t, int64_t);
+
+uint8_t ssubu8(CPURISCVState *, int vxrm, uint8_t, uint8_t);
+uint16_t ssubu16(CPURISCVState *, int vxrm, uint16_t, uint16_t);
+uint32_t ssubu32(CPURISCVState *, int vxrm, uint32_t, uint32_t);
+uint64_t ssubu64(CPURISCVState *, int vxrm, uint64_t, uint64_t);
+
+/* share shift functions */
+int8_t vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b);
+int16_t vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b);
+int32_t vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b);
+int64_t vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b);
+uint8_t vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b);
+uint16_t vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b);
+uint32_t vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b);
+uint64_t vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b);
 #endif
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4..c720e7b1fc 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -56,26 +56,6 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     return vl;
 }
 
-/*
- * Note that vector data is stored in host-endian 64-bit chunks,
- * so addressing units smaller than that needs a host-endian fixup.
- */
-#ifdef HOST_WORDS_BIGENDIAN
-#define H1(x)   ((x) ^ 7)
-#define H1_2(x) ((x) ^ 6)
-#define H1_4(x) ((x) ^ 4)
-#define H2(x)   ((x) ^ 3)
-#define H4(x)   ((x) ^ 1)
-#define H8(x)   ((x))
-#else
-#define H1(x)   (x)
-#define H1_2(x) (x)
-#define H1_4(x) (x)
-#define H2(x)   (x)
-#define H4(x)   (x)
-#define H8(x)   (x)
-#endif
-
 static inline uint32_t vext_nf(uint32_t desc)
 {
     return FIELD_EX32(simd_data(desc), VDATA, NF);
@@ -2195,7 +2175,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                  do_##NAME, CLEAR_FN);                          \
 }
 
-static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
 {
     uint8_t res = a + b;
     if (res < a) {
@@ -2205,8 +2185,7 @@ static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
     return res;
 }
 
-static inline uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a,
-                               uint16_t b)
+uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
 {
     uint16_t res = a + b;
     if (res < a) {
@@ -2216,8 +2195,7 @@ static inline uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a,
     return res;
 }
 
-static inline uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a,
-                               uint32_t b)
+uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
     if (res < a) {
@@ -2227,8 +2205,7 @@ static inline uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a,
     return res;
 }
 
-static inline uint64_t saddu64(CPURISCVState *env, int vxrm, uint64_t a,
-                               uint64_t b)
+uint64_t saddu64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
 {
     uint64_t res = a + b;
     if (res < a) {
@@ -2324,7 +2301,7 @@ GEN_VEXT_VX_RM(vsaddu_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vsaddu_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vsaddu_vx_d, 8, 8, clearq)
 
-static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT8_MIN) {
@@ -2334,7 +2311,7 @@ static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT16_MIN) {
@@ -2344,7 +2321,7 @@ static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT32_MIN) {
@@ -2354,7 +2331,7 @@ static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT64_MIN) {
@@ -2382,7 +2359,7 @@ GEN_VEXT_VX_RM(vsadd_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vsadd_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vsadd_vx_d, 8, 8, clearq)
 
-static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
 {
     uint8_t res = a - b;
     if (res > a) {
@@ -2392,8 +2369,7 @@ static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
     return res;
 }
 
-static inline uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a,
-                               uint16_t b)
+uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
 {
     uint16_t res = a - b;
     if (res > a) {
@@ -2403,8 +2379,7 @@ static inline uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a,
     return res;
 }
 
-static inline uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a,
-                               uint32_t b)
+uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
 {
     uint32_t res = a - b;
     if (res > a) {
@@ -2414,8 +2389,7 @@ static inline uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a,
     return res;
 }
 
-static inline uint64_t ssubu64(CPURISCVState *env, int vxrm, uint64_t a,
-                               uint64_t b)
+uint64_t ssubu64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
 {
     uint64_t res = a - b;
     if (res > a) {
@@ -2443,7 +2417,7 @@ GEN_VEXT_VX_RM(vssubu_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vssubu_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vssubu_vx_d, 8, 8, clearq)
 
-static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT8_MIN) {
@@ -2453,7 +2427,7 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
@@ -2463,7 +2437,7 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
@@ -2473,7 +2447,7 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
@@ -2914,8 +2888,7 @@ GEN_VEXT_VX_RM(vwsmaccus_vx_h, 2, 4, clearl)
 GEN_VEXT_VX_RM(vwsmaccus_vx_w, 4, 8, clearq)
 
 /* Vector Single-Width Scaling Shift Instructions */
-static inline uint8_t
-vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+uint8_t vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
 {
     uint8_t round, shift = b & 0x7;
     uint8_t res;
@@ -2924,8 +2897,7 @@ vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline uint16_t
-vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
+uint16_t vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
 {
     uint8_t round, shift = b & 0xf;
     uint16_t res;
@@ -2934,8 +2906,7 @@ vssrl16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline uint32_t
-vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
+uint32_t vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
 {
     uint8_t round, shift = b & 0x1f;
     uint32_t res;
@@ -2944,8 +2915,7 @@ vssrl32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline uint64_t
-vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
+uint64_t vssrl64(CPURISCVState *env, int vxrm, uint64_t a, uint64_t b)
 {
     uint8_t round, shift = b & 0x3f;
     uint64_t res;
@@ -2972,8 +2942,7 @@ GEN_VEXT_VX_RM(vssrl_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vssrl_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vssrl_vx_d, 8, 8, clearq)
 
-static inline int8_t
-vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+int8_t vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     uint8_t round, shift = b & 0x7;
     int8_t res;
@@ -2982,8 +2951,7 @@ vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline int16_t
-vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+int16_t vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     uint8_t round, shift = b & 0xf;
     int16_t res;
@@ -2992,8 +2960,7 @@ vssra16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline int32_t
-vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+int32_t vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     uint8_t round, shift = b & 0x1f;
     int32_t res;
@@ -3002,8 +2969,7 @@ vssra32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     res   = (a >> shift)  + round;
     return res;
 }
-static inline int64_t
-vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+int64_t vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     uint8_t round, shift = b & 0x3f;
     int64_t res;
-- 
2.17.1


