Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3CAC43327
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHps-0002Mr-8z; Thu, 02 Jul 2026 09:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpr-0002HX-Jj
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpp-000854-Ix
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0Zb7406354
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wet8qEMGopXXCXIfDN49R3DqrpqL7GGJHwvgulu1+ts=; b=T63V4nhfrXgSE0Wx
 XoRwQktFCM/w4B0IDuxf/oiXiIqkN9gaPOfXEHLWSEejCsQx8M13Ggz2J4SOad3F
 zj1L5zwWLnlY6so6cyO8cPaSzB8DNi1tfNR1De8X1aB4dD925lp48TZdwausWfUk
 h9UhUK/1S46BQhb3OIRh2tl8BXXiUE1Hk4/jWQbCyjac6o/YYq/tNQ+LN7p2ie7X
 YLXCB3KcYbcYCnCyYjkvrGeKVlincDDeFqVdk+kh8zVMBYbntPzYsuMoAhDXtthX
 Pp8BNfj2SgPTOgbJU71T7bDuKsGheXcedDfvg+NvXv+DdG6qFH2twpFNBnFea+e5
 mQcTEg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98j10k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:51:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-736e9030d93so1870190137.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000318; x=1783605118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wet8qEMGopXXCXIfDN49R3DqrpqL7GGJHwvgulu1+ts=;
 b=Azf7Go3C4wVV19DQSbhwrUl+hba/tfjKKDxgtYFWmfl7roVN2u7bK8PiqtgLpaMyZB
 aiu6wi3nbVCrMpu9tFaMhqZxfb4pIfnlsNu0KWSnog120VgnEjGpGArhVh8aRLRxZkoY
 LyV0VEWBPEza2guIUc6t25qZULgR4A8/Ld2TgAZcVO0Gz054cPe+nXxD4B6oAkR/hHCD
 I3nL/eTlSec081RmSVMvI6XXG02jenEPFDhnEslardufdC4zUeexQhyFyv7Y0v9ksM08
 0hpQdYpXlj5HNWYImeZo/YxkUVwk8fKbQpK3PCvK6LvBgROt2V/XFRpyTG7wra3yQiNz
 1eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000318; x=1783605118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wet8qEMGopXXCXIfDN49R3DqrpqL7GGJHwvgulu1+ts=;
 b=g0xWCRgJKZ7lpC214StoO83sakwK9wL5+Ligk9r+J0Dz08FrSGzKlBNobo31r8/6/I
 OVPXMITPunr7yj0DPggBm4RCeqmeOJduPv6Pud+8ReDal6RHa784nHc3eMIJtfvKFN1G
 gN8VuTrWLeTry/WnElm86hYXa1EKOzbpErP9gyF3EJqM5SKOk2JPgNxZ2K0fhXUprJKW
 +9LFNLJ5r44GLqC4hgxWqTUGydvkFGdMVU12fEAc8xN1ttidRiOcAs+cBjRSr+TFoJoK
 fUo1w3TgpTs9VIWb7hAwyJYPZo7JkIawajiJg3yxSdXsZbJZ3gcVAm7b8XuRfw6A84jY
 c5iw==
X-Gm-Message-State: AOJu0YxK8KMf9CEZOXcP9C24i61TdHd2KB43FILKCu6o0aipwXy5jA5r
 SvXP/tNOAxDHkcialUkqSpuZPvflheV6tEXmHOkTT+d0vMQd70Pikwt9ryBFaT2exkb+DZFYyan
 V9/8yPYXD8idrnFLbRmk4OdvyzOnKYVrn4mT1k0v+Cs36YqOAUsfvtG4j2g==
X-Gm-Gg: AfdE7cmEBdq4ruNhK+3QD9URwA4ucH7y/N5k/BtiRB63EKgrrcBAHMcrmJq8raS4cUK
 ELEMYELpDNLNfTMMlA8DzQWwbHlg3A6lV5PfzhOAsH6MwQeAdBt5nv0C76b6p+5gGV7TyXSkNd+
 Ns2f+N4BxynVQLgZxq60yYcakjESDgKavmUj7Mo20lGHvuhUcXks0rNVwAFDLgJqDIBRfYZNkt7
 Y35vHX4+H1aUeagsz/x/N4sBoTeHd4k27u456ZDO46M8aV9MRtfnkMuBo9MKD/x35A5Z4HX8+Yp
 /9MBOTcKL3ox5GBpvxiS5eHNTjAERDFUZ6EvcAOKYXLgr3ZwYAtysTKbAW0OJW/cUsguBF67o1G
 06bhjovQWeO+KHgE3U/VTPJRVIesrtkOSlBtdo32cUFl4Dg==
X-Received: by 2002:a05:6102:304c:b0:737:783d:1912 with SMTP id
 ada2fe7eead31-73dbe560d03mr2783917137.12.1783000317901; 
 Thu, 02 Jul 2026 06:51:57 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:737:783d:1912 with SMTP id
 ada2fe7eead31-73dbe560d03mr2783904137.12.1783000317450; 
 Thu, 02 Jul 2026 06:51:57 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:51:56 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 09/24] target/riscv: move csr.h to tcg subdir
Date: Thu,  2 Jul 2026 10:51:11 -0300
Message-ID: <20260702135128.1188021-10-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XAmlBydDs-3naJV7W99ZG6JuBf0-cJXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXwWdviukD1Kjb
 4x/RWqZOXBfAH6qUUrFAzXEZjGHzh1YaESKj9HOEhtECMmNoA1wBpbgI/1KXzOJi/WX09htTam+
 OctpjgDwgyTBGh2a79IyDwDKWsRrUEoWUxYMkHbhB9Z8BFPjl+ZunqwjSCSmYcxAlj/hpUFIlLk
 Hg+2cpTgxNFCcvGDj18oGmN2fsVNbxOu71G1OsAzX+r0qovnNekgevGJUs929aAWElQariY+RlU
 sHIUOolrgl8lsEW+gjFWN1ksAe83628+//vXeTzEVgyUjZX3pkhHxpTNyxd0RfIO7V9mtVY4qzM
 bDWy0DRDmHK5xMVZjLjt76aINV69QUJwz7LBJmZerinjKMqMpngVR37ne8AQ9oGAoJwm5K2gHrh
 iyJa9dBRP1Q/awK6T0A9J2hRZpkbDIrbtz2G9KKa/PqeqrD8igBj6KS3uc2y9BH7/r9WsmjdTsq
 UALfGVJcxAM3ZUhPPUw==
X-Proofpoint-GUID: XAmlBydDs-3naJV7W99ZG6JuBf0-cJXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX6pyAzU5NDplE
 n6R4PRsTHEZY6+oin952tkkSgUXHDcN3lMAHeE1Va2rzvjEEwme/vTHQVMK9vbMyRGR94xmaxRq
 9QyswZYTtnbv8Dbqxxf2TuzyTPHE1Ps=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a466cfe cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=82-PFmB8izlBMBISFaoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
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

After KVM is no longer reliant on csr.h move it to the TGC only land.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c            | 2 +-
 target/riscv/gdbstub.c        | 2 +-
 target/riscv/monitor.c        | 2 +-
 target/riscv/riscv-qmp-cmds.c | 2 +-
 target/riscv/tcg/csr.c        | 2 +-
 target/riscv/{ => tcg}/csr.h  | 0
 target/riscv/tcg/mips_csr.c   | 2 +-
 target/riscv/tcg/op_helper.c  | 2 +-
 target/riscv/tcg/pmp.c        | 2 +-
 target/riscv/tcg/th_csr.c     | 2 +-
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename target/riscv/{ => tcg}/csr.h (100%)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 96e9efbf01..cc739e3f38 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -24,7 +24,7 @@
 #include "qemu/guest-random.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "internals.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a2bbaf7f07..f0a5e0d86f 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -21,7 +21,7 @@
 #include "gdbstub/helpers.h"
 #include "cpu.h"
 #include "internals.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 struct TypeSize {
     const char *gdb_type;
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 7aacd1d89c..f8042db9cd 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -22,7 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "cpu_bits.h"
 #include "monitor/monitor.h"
 #include "monitor/hmp.h"
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index b94e8391ed..2647deef91 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -35,7 +35,7 @@
 #include "system/tcg.h"
 #include "cpu-qom.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
 {
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 2092cd712f..4657b17e2d 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -21,7 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "tcg/tcg-cpu.h"
 #include "pmu.h"
 #include "time_helper.h"
diff --git a/target/riscv/csr.h b/target/riscv/tcg/csr.h
similarity index 100%
rename from target/riscv/csr.h
rename to target/riscv/tcg/csr.h
diff --git a/target/riscv/tcg/mips_csr.c b/target/riscv/tcg/mips_csr.c
index 609718f288..884030e91d 100644
--- a/target/riscv/tcg/mips_csr.c
+++ b/target/riscv/tcg/mips_csr.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 /* Static MIPS CSR state storage */
 static struct {
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 6d4849b135..ba3c7da375 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "internals.h"
 #include "exec/cputlb.h"
 #include "accel/tcg/cpu-ldst.h"
diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index d93563c36b..41b55519a8 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -23,7 +23,7 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "trace.h"
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
diff --git a/target/riscv/tcg/th_csr.c b/target/riscv/tcg/th_csr.c
index 431f4cc286..e6f642991c 100644
--- a/target/riscv/tcg/th_csr.c
+++ b/target/riscv/tcg/th_csr.c
@@ -22,7 +22,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 /* Extended M-mode control registers of T-Head */
 #define CSR_TH_MXSTATUS        0x7c0
-- 
2.43.0


