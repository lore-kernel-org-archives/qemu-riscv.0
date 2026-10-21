Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DA2606E847
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHkOgYMR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q08HFRoD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMqI-0007Gx-G7; Tue, 20 Oct 2026 23:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMp2-0004kP-Tn
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMp0-0002xY-Tj
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:00 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FCC53116289
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PdLK6u7tq/yz0P0iF7Doi4UM43eIYN0OLasV3GDT2vU=; b=fHkOgYMRTnjiV+5N
 +PrplU2M2RGa3jxm/6r74ILatDMZADVf+VuVgRQRglzpWgWkH4pLkWO2WSReI6Bn
 /3amvW4o6cnxxwHUSieCiG/6ZvQa67DmuLCZf2GRfRETnp45PR7GhxagpFcGU79f
 etQTbCmZdmn7m/v8XmI0LuYtimgSFfDMwOgl9wPqiqYzaSjkqt2U5msaEQB/rYjE
 GI9+4CHrMvk0EBD76eDXmnjQzAkFuxovQ2uIJiFU9iBffy8PoGZWogev6CNnmXkI
 dMI66Pedr2RHl8hwxTJEVCYArZWvNoM5KyFqQqrNHlGBiCPiQ1Ja1gPyZDy1joph
 +KdFAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hsr3j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91961d4b31bso8383416d6.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552607; x=1793157407; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PdLK6u7tq/yz0P0iF7Doi4UM43eIYN0OLasV3GDT2vU=;
 b=Q08HFRoDN/jgLJ14h3duL4FC39ODPgGI0qFBwDtuxycpCjBIbhQwz71+JzbdN3v0en
 n3Y07r55w4ZysVhkFE3zTgpmS0R1xS729hs3g8IhmbfzsF/vvzTLqG1KvkI2TWLOayTr
 /zFRjxzo4JyGEEpbyKDfjVbpE8hu7yv2zROaGVJk2SIOn+taCIfYsvVmpdyzAlRW2Uxf
 DE/RDYhFpOzQWfDp04ivcfxE2bZOljczIkTLffcf9Gx1BkilBcxqvsHBnUmme7rHNMWV
 xtCJTvM1wh+6IM3OFD5fzBWdVNE7CWA8pCHz8v658tTmvKXXt1sZQPMB4goZ+Cc1tMi4
 KC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552607; x=1793157407;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PdLK6u7tq/yz0P0iF7Doi4UM43eIYN0OLasV3GDT2vU=;
 b=mAw1UNFcjhXUqv/sSR3557HpGdzTYXcVdFxiXaqrsrppTAAI82FxhX7FMrmKPcrgDl
 s/g3X4xTr/sgbhwUzrriSJy3ZrmaSNvvyxjL8aCiM6yNUKFlCl5OqgF/+AXuiFjB/wua
 9TKf09H+tR/Zj8NCm9YPHSe5k6+1hF1JQsr8YN7NCL/3450Lu0KCvPlWQME+Pso6ubp9
 XHdguIb2k0+U+CxwVk1LMW8eAkBY7g/XjoYkn8LDG331pY4bY+Ro9FefngONAdavjDH9
 JPZ64Gy9aFB50aTmup9ziqCyqHOmtnJRhxVG0xIIIwtH0TUJ82Ymx8V8xwyG3XI7FUxh
 0wWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNE+PhvuBhiEmxnI/sb+DMdaXDh7CLXj3rAH0TmhqZ2nou2XLp/rDVG6Otk39+pHJkOBdz94B88eEo@nongnu.org
X-Gm-Message-State: AFq9FYJW3cHlvQlzBdXa1soQft+G9WyL9ixowzfTfQbFzvZ6LzRVIz+c
 oBRSMcRxj2785NiaFEwcDA+Z5K+CQ1121apN4gcq2PCZHZqiUquzWZRy6vnR50q9gD0La7UGs0k
 9Wqve7kA4diAXQHxzTFoJmQLCmdZQ79n3kWsHVd/DglxDdmLXAq2i2N3Kbg==
X-Gm-Gg: AYBFou2YTzsrhbH0UoyPmwcaPunnrsBWJ839SlhD0MvDthoMbQi+zB89aq0suQZnp1m
 x+3NSKAzZFr7LLVT6JyEkG678tEYvCtYfoBdAeiG9vyqzZaAfAfdUfzT5u8/iGAJfvQVTtytcJr
 535V6AdUxHK4pfZv6m5AHWiyygKjDPpxq6ubTXJfQXaakgBqt6jiNcaefR/2nAe6xC0xna3bErK
 P43YUu7mBNXICbOjh5B1gWIznazzLriTDZR3kIYDEsClNPJ3OS7WZbJWpCuzcT525zjRtpybWXp
 uv8ErZqpLH/9R8m+kdjM56USMjoScjUui4UkZX+46kZoqo8YtSxhRCekEJgBH63sl1NCm+Nczb/
 JMr+BAkYb0bRc6CwDVIT8Rsvq9vizjZO5UFSuV6fH
X-Received: by 2002:a05:620a:258b:b0:93c:8544:6ad8 with SMTP id
 af79cd13be357-93f57f70fbfmr194776785a.28.1792552607149; 
 Tue, 20 Oct 2026 20:16:47 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:93c:8544:6ad8 with SMTP id
 af79cd13be357-93f57f70fbfmr194774885a.28.1792552606590; 
 Tue, 20 Oct 2026 20:16:46 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb80f05bsm41137525e9.3.2026.10.20.20.16.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 20/33] target/ppc: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:53 +0200
Message-ID: <20261021031407.24862-21-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad82e9f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GQJXTKmK7mRzDcunaLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX1KQxo9mtCOVu
 smAWlV5IQvUVOHAsLnBxc+JupcU868gG6pJdAFGiFL2vgdhavVyCgx9FUf1A0dQgrBC715KbgvW
 o2hOXPB0ahRRaswez8XylbkK/+Wvpvg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXzgcgWOU9Aq/B
 BIAc9lPnr0ipU7nR4S7SffDV45+06Ff7UzLle/6NPhIDXq+DST63G0Pu5LDD56MpWGZGC7kTbjo
 LVzrOaEo8YVrtNXQLMLG+ImwMvBjFciktEQ0oljvJqsJyzIu0wbIzl7bRleBvuk4kothcVaxhE8
 1ciVuQkWOvsF2j/gCb3VZCBOp+y/7nj7ZkLjq9e6Pd5BfaqlER+5DCXdYhOTD2SYBb7TF9YSQK6
 RR/GT9p8UJ5+Ys7L0+BsbRC3KrG5V6pWK1eEAx88zGGhMxVqCIKXM/a+o0vYhNFirWMXSSqVkQW
 +WyRUq0bNXPe/4INHCM/X3zFMRAeN1tg2lu+LWrgKcKVeQDbldmP6+oMWP89iwyI4pJIxtslToH
 skl7p/bH92D6a9KSl1GdZiovcSZRCBqPkjVorBA1Q3dYvL1rmy92Mz/YeXajShmEYJYE8/1jTCb
 nAOyY4tIp/YJZjzrYNQ==
X-Proofpoint-GUID: JBf6f4Q_y2GfZZcgNeLnoyd_O65_UImx
X-Proofpoint-ORIG-GUID: JBf6f4Q_y2GfZZcgNeLnoyd_O65_UImx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose powerpc_excp_name() prototype and register it
as the CPUClass::exception_name() handler, so the common
exception logging can resolve PPC exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/ppc/cpu.h         | 2 ++
 target/ppc/cpu_init.c    | 1 +
 target/ppc/excp_helper.c | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3fb51bbeb82..4eb7db3d727 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -153,6 +153,8 @@ enum {
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
 
+const char *powerpc_excp_name(int excp);
+
 /* Exceptions error codes                                                    */
 enum {
     /* Exception subtypes for POWERPC_EXCP_ALIGN                             */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b711f9c0a85..d5f9ac28020 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7529,6 +7529,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, const void *data)
                                        &pcc->parent_phases);
 
     cc->class_by_name = ppc_cpu_class_by_name;
+    cc->exception_name = powerpc_excp_name;
     cc->list_cpus = ppc_cpu_list;
     cc->dump_state = ppc_cpu_dump_state;
     cc->set_pc = ppc_cpu_set_pc;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 895127fb2e6..66675f1fdb4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -33,9 +33,8 @@
 
 /*****************************************************************************/
 /* Exception processing */
-#ifndef CONFIG_USER_ONLY
 
-static const char *powerpc_excp_name(int excp)
+const char *powerpc_excp_name(int excp)
 {
     switch (excp) {
     case POWERPC_EXCP_CRITICAL: return "CRITICAL";
@@ -107,6 +106,8 @@ static const char *powerpc_excp_name(int excp)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static void dump_syscall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
-- 
2.55.0


