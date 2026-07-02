Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A52C43327
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpt-0002OA-Q0; Thu, 02 Jul 2026 09:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpo-0001vz-KP
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpm-00082p-RZ
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:08 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662DcXD5564716
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qBLq/hTlgm1QtyfB42Sk4kHf4dGeBXIWIn56JGk66ik=; b=WYCykbE+IsETdIuY
 dZjmmZ60lkQvlaE1zLcPNlhJ0NL8lzrA9EqjwHn/BlI2hJD8MIBgmT6GZ6NANIeF
 W9ogj9QeqDMIxa0ZQrx1CImS1aG01b0lAhbTrUsGs407nuzO22FhtAxlfyuNxSBZ
 kP6lsgi+3TupTukAwjRTCFr0kksSmtFZOTIkM69jvK2cPF1sm09YHl5tzXypocFv
 yvJcE4dA4yfB++MgYAv8w3Qg2aUS9Ji8NHzOGlD0MuwhDjS6CRkmr/eLqOHPWvMx
 SJW62R2FJbquYJsR0xdj4xuYWUEiCK1b4b0nq0+bGBrT0qgOuUTWZB2BdqQX5XbM
 VGyKHA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2501uq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:51:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5bdaa7039d7so1797161e0c.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000315; x=1783605115; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qBLq/hTlgm1QtyfB42Sk4kHf4dGeBXIWIn56JGk66ik=;
 b=H9rymkfl8xKvd15aGqFN0Gjn8W98jEcnMag8sc0f3QuNPvvBHEpzwZG2BPa5BaGn4K
 wqjsCTTpF8WTdYkC0fCnIeEyrB64UD6gpVBxSrDz+kL3p6Z9lwZMl0SRKgu+4To9zyep
 99MjABcuzriemgcf3BQuDcBRtNnQn0yAn91GYHIEkDJjroSdJYrtPBT1fEK3eU4Yr20h
 xOeIJ9XKJsBHmTuYWVk2TtfXU4Fze6nZUPvoPRza5BWz4ETFnCsk3TgsvR3n9N/a9dA7
 hpjeELOc4G27uRat0f4meh9ncpnT3VMuWg8RYrsDeG6U9GZ1qcHBfMnQy+fZxhMklwrs
 lGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000315; x=1783605115;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qBLq/hTlgm1QtyfB42Sk4kHf4dGeBXIWIn56JGk66ik=;
 b=Bn46DsAOa6XI8d4qOusFbUKr12bF2Fvbphz0hP24E1OFgGZchWA4iFq/aBOEz8ahBU
 iobhPTgBiwzjZYRUNtP3yK6c4QijKOKfYIHhCcZ0g9f9kGHJlI0A2p3bKy8QA9LaVHVU
 2UdonXLWpB5qXvWMgCoba8nzlWIE1dqF9D1MzVYb7sYSl2oKsOjpH8AWh7fSkHxmKH3m
 DdKsuYLFCSAtBNlXrrsstj9PRYdqbLK4l8XU/zFlNpfiKGMdECFO3LeCIABG5g+I0+hx
 0Mr16uNqNNy5QEMpdKCcDbBK4ntcEfoy8UytaQ3qemRWejj9Otci8HLC5bCGhe2jSAkz
 o3PQ==
X-Gm-Message-State: AOJu0YzaaIV/onNPCdUdnI7F4ZE/TbAVoSeKrYbKul5cTeo9DT9Ci3ll
 b4WZiSYft7rzM9d1/EbLLe4Sqepxh9ArCIpaX04ZNIM43ONxyPRsf9Cm31bM39m2G+HqJcqjRYM
 pmN28V3JtOcw5Hjkam6CnVztROLmN6NXpXBkRUv3/Q4uEjBbJrFNzapQfCA==
X-Gm-Gg: AfdE7cl/fnOvp3XUZO0UzLJUH0gQxpGVB0ZmQ0E2XTDmcI+WfcnNO0pbDRiHYcEr8su
 8U7GLhbNaQGKlXHBfShjnEfcQq6erivIjGb047YeyIdzp8Kif8hk00q5MD4nWowTmOlnRkml5O0
 34U5UKaAFwqfyaTqz1dRqP7qwDpJIIk49i7q4Iwph4tVHWPQeOBTvCl1FsUvhpVO2Mu9nOq40IP
 GlYvXQsbQef04uR7bYic+GYRmXNOOGKbf86JMi11qK6aYeEym2lyJ4pgSmycPu9WP2u7hyESka7
 Sxky9bHw1qxXMeYN9bn0PvaZMVTDk3jBa0PjzTuHYaDKMk5Qz4LRjwKJQV02YWr5Dw+XTTgyh8B
 KLzU+1fxeczsDHfj+9oUOIyaO/rH3MaUVTUStx8BvYH08tg==
X-Received: by 2002:a05:6102:4414:b0:739:4fa1:50aa with SMTP id
 ada2fe7eead31-73dbf3a292dmr2417846137.14.1783000315293; 
 Thu, 02 Jul 2026 06:51:55 -0700 (PDT)
X-Received: by 2002:a05:6102:4414:b0:739:4fa1:50aa with SMTP id
 ada2fe7eead31-73dbf3a292dmr2417833137.14.1783000314862; 
 Thu, 02 Jul 2026 06:51:54 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:51:54 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 08/24] target/riscv: remove csr.h from kvm-cpu.c
Date: Thu,  2 Jul 2026 10:51:10 -0300
Message-ID: <20260702135128.1188021-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a466cfb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=KJWeSTv_TiI39BqBT3cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: OWwkKy6-Y_O1dKvvkpVNXpmXSrjfWFiS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX40L7j+7CMP37
 n+kqjYrCiZ0ym8Ob8YZ1FwSZsd+nOoDPTqYJ4FbQYr7krpxXwVOONh8IdUujesBl2iZATZrQitQ
 dTTQNEqm4NhveJiWbgtOz7xgbMznonL2gH51bUcrjq3vQ4mPL135dazPXjFQS7jyRFk3+6WaLki
 ZzYsknYCypXWLvloNrw3knFAt/54yoFmjH8gT2mLqEUlVXXMv7Vv0El+dzSk4bw9uMZ+0CFlHN9
 n1g8+O/WZBIKLnHOSVyLBnVQW/LYKdGl8kdIdoMpQrc9PlmExBJg0pFoNNhVSsUS3weKxeNDhEP
 R+EUfY6+eA+7HgnsV3NLqT0W5v//UZ1In6iS+fwN5ZFNguDkKhI1nl4kJ85hW3yjyOJNk+9hmsE
 KnbwPKC2M7zUqlO3oLqCYJNjfliGad+6Qstf4k3qxKezMTJ0HS6gMdP5wmSm/lcE7/sK+ebaAZi
 BO4xelUHI0cUJLuC7jA==
X-Proofpoint-GUID: OWwkKy6-Y_O1dKvvkpVNXpmXSrjfWFiS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXzdZw3dzcTPau
 sFPZHtbfpbZj48rowUMACk2tmDaMecnJHwPlYwTjzn7GlsS9SnwyueU+U1P4nZjOEMaRMn8Sral
 f3XP1Mo20anE8/TxdeatmWOCHyiPXYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Move riscv_new_csr_seed from csr.c to cpu.c since this function is
shared with KVM.  With that we can remove the csr.h from kvm-cpu.c.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 30 ++++++++++++++++++++++++++++++
 target/riscv/cpu.h         |  3 ++-
 target/riscv/csr.h         |  3 ---
 target/riscv/kvm/kvm-cpu.c |  1 -
 target/riscv/tcg/csr.c     | 29 -----------------------------
 5 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 301f4b3dc9..96e9efbf01 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/ctype.h"
 #include "qemu/log.h"
+#include "qemu/guest-random.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
 #include "target/riscv/csr.h"
@@ -543,6 +544,35 @@ static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
 }
 #endif
 
+/* Used by csr.c and the KVM driver */
+target_ulong riscv_new_csr_seed(target_ulong new_value,
+                                target_ulong write_mask)
+{
+    uint16_t random_v;
+    Error *random_e = NULL;
+    int random_r;
+    target_ulong rval;
+
+    random_r = qemu_guest_getrandom(&random_v, 2, &random_e);
+    if (unlikely(random_r < 0)) {
+        /*
+         * Failed, for unknown reasons in the crypto subsystem.
+         * The best we can do is log the reason and return a
+         * failure indication to the guest.  There is no reason
+         * we know to expect the failure to be transitory, so
+         * indicate DEAD to avoid having the guest spin on WAIT.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
+                      __func__, error_get_pretty(random_e));
+        error_free(random_e);
+        rval = SEED_OPST_DEAD;
+    } else {
+        rval = random_v | SEED_OPST_ES16;
+    }
+
+    return rval;
+}
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 70b8729bd7..c0e9098728 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -972,7 +972,8 @@ bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
 extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
-
+target_ulong riscv_new_csr_seed(target_ulong new_value,
+                                target_ulong write_mask);
 const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
 
 const char *priv_spec_to_str(int priv_version);
diff --git a/target/riscv/csr.h b/target/riscv/csr.h
index c791260f83..73d874ee98 100644
--- a/target/riscv/csr.h
+++ b/target/riscv/csr.h
@@ -12,9 +12,6 @@
 #include "exec/target_long.h"
 #include "cpu_bits.h"
 
-target_ulong riscv_new_csr_seed(target_ulong new_value,
-                                target_ulong write_mask);
-
 RISCVException riscv_csrr(CPURISCVState *env, int csrno,
                           target_ulong *ret_value);
 
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 39d48a9db4..dcdaf7f2b3 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -31,7 +31,6 @@
 #include "system/kvm.h"
 #include "system/kvm_int.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
 #include "trace.h"
 #include "accel/accel-cpu-target.h"
 #include "hw/pci/pci.h"
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 7da20b5500..2092cd712f 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -29,7 +29,6 @@
 #include "exec/icount.h"
 #include "accel/tcg/cpu-loop.h"
 #include "accel/tcg/getpc.h"
-#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "tcg/insn-start-words.h"
 #include "internals.h"
@@ -5584,34 +5583,6 @@ static RISCVException write_mnstatus(CPURISCVState *env, int csrno,
 #endif
 
 /* Crypto Extension */
-target_ulong riscv_new_csr_seed(target_ulong new_value,
-                                target_ulong write_mask)
-{
-    uint16_t random_v;
-    Error *random_e = NULL;
-    int random_r;
-    target_ulong rval;
-
-    random_r = qemu_guest_getrandom(&random_v, 2, &random_e);
-    if (unlikely(random_r < 0)) {
-        /*
-         * Failed, for unknown reasons in the crypto subsystem.
-         * The best we can do is log the reason and return a
-         * failure indication to the guest.  There is no reason
-         * we know to expect the failure to be transitory, so
-         * indicate DEAD to avoid having the guest spin on WAIT.
-         */
-        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
-                      __func__, error_get_pretty(random_e));
-        error_free(random_e);
-        rval = SEED_OPST_DEAD;
-    } else {
-        rval = random_v | SEED_OPST_ES16;
-    }
-
-    return rval;
-}
-
 static RISCVException rmw_seed(CPURISCVState *env, int csrno,
                                target_ulong *ret_value,
                                target_ulong new_value,
-- 
2.43.0


