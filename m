Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E148C5CFE7
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtrJo-0007xj-TW; Tue, 11 Aug 2026 14:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJf-0007W4-Ce
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:35:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJd-0002aV-GE
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:35:11 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BGOHwv1094027
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VrfE7e/OO/Q4kyhaEr9Sc92fr3TG41A1jbOfCVVmhYI=; b=DelrVk38tz8OQPkw
 hIN3iyMJZdKKV4ZWDO0CiO/L1/LbBKFv3Sf7C6UY/5BD0eL4wwZh0giVIWDp0y+I
 v3cvo48k2KycEaELWYAYJ+9fKMaHNpq6DZsWgkNJobqvgNZ6ojHCsBmukNDDUg1U
 /W4+CzW9BC27JUxo6PVWHqLdnSsrd72U3+mgM1upUe7jS6r7bQ6DCzihZRFXW8mw
 dOP8xWO+vvq4ANVT4j+RpHHuJD+xeWkhliWxOjsVWXlvNiYuld//00U734LQCUzR
 wRQJFZ4uW+wtoQMGd/oc+eyatJaas7/GpQWb12tpAMIEnlMdynXxFwKyh7gVOQnM
 xZaMDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gsj88-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52cd0374265so3764141cf.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 11:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473298; x=1787078098; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VrfE7e/OO/Q4kyhaEr9Sc92fr3TG41A1jbOfCVVmhYI=;
 b=BTftGAjZvfbz4vKev8AzS/pD41gt6YZhCO/vPG4W0tkmUvuA1uZ5RTpEBn7mlYdWoP
 NsfvkSp+1v2nPnWTMEBablxaAgVLFBdMjzkM/jjkp+ldCTMWcAoy6G4BvrJ7K0EoKctr
 VUCSerOXbIV/xggbquM7x58U28j4VeZinjt93zOpjER4o6G8hRZC6RIhoCVtcq5hWzyH
 fWF0XGIBFwL0IPCK9aUJRGekt1cJZbICL17MEugp/FyGEA2ZHoCXJfYwXnTlZfT5Ys6d
 e9G9CVeRzkK+pbSY7l6N2w+8PTOvp4zcLRlnppvHD6a8v2diD6dck2WzWW3kUVOjm6zu
 pqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473298; x=1787078098;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VrfE7e/OO/Q4kyhaEr9Sc92fr3TG41A1jbOfCVVmhYI=;
 b=pJIUlYBbb0w3wd9e+WS23LFz16yVtgYGqkHC5e14WZInCqzO7hNZx4hp7uMLA856Q3
 HM95IpJDcmAZh+Rz/DUPvcS9w+pLCbuj/o+9CeJbBBc3p1IAbV1SIgwYyO8cFi+4dlvK
 NsEIjr2Bz55SyvImUsRZaQQNL+COORP3hX6ZITvvVJQ5RNlQZ7xgTZ6MKfSWQjLDSb9r
 rjz0K/x8/36MQWx2WS2jq3jirZtt2/EyRDjzuzmUU2kA/suHaMCzgtBYbCKpq8AGhIh5
 Twa+NfYoX4YcxnMcVu2vOd85s8tVTNvOpwe0HT/ffY2pH/QI4sEIYros4DIPGAwFOiUS
 Z3KA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDIckibR49YdfsrXWK5bKMmKzCrt8qlYE7pyFAf3vqyFIcQHDSvzwY1Ha3d48siYEax1gwNYR+JRLe@nongnu.org
X-Gm-Message-State: AOJu0Yxgi8AI4L3iIxkrHnxXCe7opYRJw64kwCLpkts5O/bm9WUiph43
 vNGQZ0M6D3BYn4IorYDdc0JnM8fR0u7J+4zgjzMq6KHhyq+D/tP0eGGAO20xxNKhQXpF9K7kg3A
 2IHjIV2ldOuYqbUWZmiJ5RQAmqUxPvpMOEaAlRw115c26gD9h9VnFKjTnJw==
X-Gm-Gg: AR+sD10IK4LOUNwnVJMwLbjzFRqOzxAB4Kq2px1Gq9hqZx5qhhZ6LipF2SdFmVgjgvi
 rFNBmbOUQYCdyGqlPRTMs8PPMog+XDjnbJC3cNC4pu0z3DOXfmWoL+BW514ntt2o4DT394+yxNn
 893liPv4CmNeeXlIfaBrn7z42Ytj4DKRt6Htw3lZnO13VqiK8Qbu0YTZphyDZhddga2+4n2TM5s
 q64vHLCd/mAttdA4H8p59jgD8WNFXt00Y3Nz/lvAzUDpBWVpR3lG/LseL3KTIJ/FKpa7mAgYZ4P
 eFn3S0pH7CVEW9YNgkrjgTf/nzlfqMwK4wBhWbFsQRFypbfc558Pn5ZbzWZRXVenBWDeGwVhipQ
 jyvpEai51tcvSi4ESFugmlAifNZnqTdudQWXan/RPVA==
X-Received: by 2002:ac8:5d06:0:b0:51c:1ff:2512 with SMTP id
 d75a77b69052e-52d58670614mr49692341cf.33.1786473297907; 
 Tue, 11 Aug 2026 11:34:57 -0700 (PDT)
X-Received: by 2002:ac8:5d06:0:b0:51c:1ff:2512 with SMTP id
 d75a77b69052e-52d58670614mr49691831cf.33.1786473297432; 
 Tue, 11 Aug 2026 11:34:57 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e675sm344795f8f.23.2026.08.11.11.34.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:34:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 6/8] hw/cpu: Rename cpu_exec_unrealizefn() ->
 cpu_common_unrealize()
Date: Tue, 11 Aug 2026 20:34:08 +0200
Message-ID: <20260811183410.22428-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX5Ck+swcZldx9
 uw4cU+l3jQ0nhy4S29vJ3SCgFA+9vZY0NDDWTDzLNKqEXxux+tG2cG54L7rFdzlyB/i/OnNrUrA
 qxd8dM/HJ3Uucv5E25LkncyQkszYR3Y=
X-Proofpoint-ORIG-GUID: ZVJ9zFlxhebHqJmF2Tb-Rw74VCqf4Gm5
X-Proofpoint-GUID: ZVJ9zFlxhebHqJmF2Tb-Rw74VCqf4Gm5
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b6b52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=--_MrfCweEvJdlqdJWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfXw9HK5UlBAxxN
 CiYtfHgvrjbWfr+c9Ax5rArUGGFSqxrs4nb7oxk2pqkZTj1Y0EW2CF0KmGry5PETMdwK4AYOEgk
 4s+DX13RaN06kO7UrjFy+wO+/cR8kxRykxU1lxObQ1V13Qh92raF8Ik6PcLozaVmwcLxFrWB5jh
 cUp0G6QlaZ0VU1m0dJiPObkzaPNzxdqV59lt5Oa8ZkH/lJWRdk3k6e8C4iNVs3rvIcoD5y30h5p
 yHHPtHfTUNWWxt+UWIqjllmIf8Z0vsPr79UIxousDgZ3By103gflerBggspi/m6GaZvpt11WbEU
 VIrJdsIKNWF7QSKF2YRKWNqnRa0Hqhc9aNUHS/jDy82m8N2eOjm5SGD/TiOr1rCCamjUtChtwWC
 zmELjEQ5fZCCVL1hPd+PVkdciarNZ1czgkclm01eNf/5+8CE4I++MOrKHa0mOe2c41n9isFBLAQ
 irys9POcJMU5azVSDxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Keep cpu_common_*() pattern for publicly exposed common methods
used by target code. Use cpu_exec_*() pattern for internal ones,
mostly to distinct between system / user mode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 4 +++-
 hw/core/cpu-common.c  | 4 ++--
 target/ppc/cpu_init.c | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7b7cf330cde..81af7b9ee1a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1180,7 +1180,9 @@ void qemu_process_cpu_events(CPUState *cpu);
 
 /** cpu_common_realize: CPU DeviceRealize common handler */
 bool cpu_common_realize(CPUState *cpu, Error **errp);
-void cpu_exec_unrealizefn(CPUState *cpu);
+/** cpu_common_realize: CPU DeviceUnrealize common handler */
+void cpu_common_unrealize(CPUState *cpu);
+
 void cpu_exec_reset_hold(CPUState *cpu);
 
 extern const VMStateDescription vmstate_cpu_common;
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 732e32fade2..59cd489b713 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -284,10 +284,10 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 #endif
 
     /* NOTE: latest generic point before the cpu is fully unrealized */
-    cpu_exec_unrealizefn(cpu);
+    cpu_common_unrealize(cpu);
 }
 
-void cpu_exec_unrealizefn(CPUState *cpu)
+void cpu_common_unrealize(CPUState *cpu)
 {
     cpu_vmstate_unregister(cpu);
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b07e9c3ff9c..e3a1075aad3 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6956,7 +6956,7 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
     return;
 
 unrealize:
-    cpu_exec_unrealizefn(cs);
+    cpu_common_unrealize(cs);
 }
 
 static void ppc_cpu_unrealize(DeviceState *dev)
-- 
2.53.0


