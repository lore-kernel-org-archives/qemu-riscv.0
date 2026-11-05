Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74289606A326
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GtDxK3HM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUweKV9p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOx0G-00064u-N9; Thu, 05 Nov 2026 07:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyv-00046P-70
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:54:18 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyt-0005t0-2v
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:54:16 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tHxL082980
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nX7INPBhRNlLnO+y4Wv2CzYvOQ+2sQ7fNu8pWhDB3/U=; b=GtDxK3HMVBIDhVIQ
 Bvm1UEiKLCqRXoOdqZdciI4lLhH1DjT8J5jOoZj/BBa50mOkZd3x/ryKEGKqORjB
 qG8ggpnN9zModum+SpyQj/pLWwblpFtTQqKPI/ztD9h0fDij4deL9FtOqsy6szjx
 FqZHqWs1upvW8BkNIFIlK/BJuMrUBLrfF8qWp0mlUMNvHh7zJiSQFRJGWLDN5YGX
 OPJQuK9QSkqk+gSLPcB2MDE7krbnWNWMhUt+rSAmACkJpx3Yq8rJPytfNZxmAzTu
 V/cOELsXDtryHd4x7Q3dY9h46oxxk5d17oqtUxDsayozCLEkDItWO1YbxNj+qApU
 LzbiZw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0v08-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:54:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91becce058aso40053826d6.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883253; x=1794488053; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nX7INPBhRNlLnO+y4Wv2CzYvOQ+2sQ7fNu8pWhDB3/U=;
 b=CUweKV9pNn4RndJaLsxWaFBA8c979nUY+Q0Lx2aB301skFIViPCV231wOv4L4PX8JY
 l/tZlqrVLaS8m0Wk3daZnhc25JMe46eCbLJHq2KdzCEdWWLQ6u0SRb9iSmYvzNnxQoxJ
 Yt3iZnUmLiJMhyntECaxOVgH0pj2f0HzTkKhrKPx6SnXt/xzL7/Yjo0k2mzY0Xlod6SO
 VqRfduTs2xoDzc/GkAcFL6cDYjYqzubiHNCCu1zT0X3p3VnKkYMWqXV+nrPyi8Lnl2EU
 KmkhS8NcsRqwa9pcve7E7xFjfcIkh7p8aYtC9kcYlPYTfAr4Ox1lOd9azNF99JncPRaW
 a/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883253; x=1794488053;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nX7INPBhRNlLnO+y4Wv2CzYvOQ+2sQ7fNu8pWhDB3/U=;
 b=Pd56yexi3Tqw1zWS7Q5AdisCWMVuMVZM1m/XOkpfwmXb9PWkdo9LeouEbDm2XtLXjC
 la5Kt2cPWnc/K2YfxN08sfdKOwHFgUV7iW0ZzQObO6vi4yF8rGSJgy2sAq0Mlr0rU3xb
 xpQpjPvzhoGkoiWjSmqDkU9PVeTnALGBhhcKgOW9nnCNY50/Z6Z8l/nu2w9/8G9ohTxX
 gD7qfBvRrcPYKIYMye7kYv575FSBRspJGCtqAuPd5qIipVGum8+p+h+oP/ATsFZPvR6L
 pdaIIh2K4JiulItUpBLrUlGAYayE8jR9C9KDbMexCddGnYNfwSwg4VSyE/3gSLZxLm0f
 BYoQ==
X-Gm-Message-State: APuU4Z+W1f1z0fdk70O/HCepKcHfVFlj0myIxFl6gLs1qVNVW3DEksb9
 TQHUA0sjVsR71G9nTUvM/YspQZbl7X4BHmUkCJV7tLPc3Tn6fSDWZY1Rgx2aBxZFgfrHm0jkI72
 EeU7lLsIuBS4os0egSIVY6H0E8QZxsazxwEjHpDZa/aH9eXvqoHHQ7BmYRw==
X-Gm-Gg: AYBFou2G5WM37zTYvy1okeenbeOrbaK7MTzBxLqdo2VOfukJJcj7JmDgLsTsRxR/1xI
 ecYefQFy9JM9+xVVdp0QNncf8ScFzJretdG43F7q9HrXACNGD0Nau7COAFjunRRmz+UlniEgKRI
 iy/ET7NMiGWWjPLkD2MoJgD1XtK0Es53I/kuotePDQz4CE4pmH3C8RVzpW1VjC0X4GBbVS5s29/
 Ef+0kqIntDmc+Axq71cIdQxnfivrNrO6rohZLzh9HMmbcWrcTs0c1LF2mVwpS/R51PaV9FE7Qja
 wIdmAnrtYkDoFYKYwdbiK6jyQCGWDtdD+CBHpu9M/Vlla+/XpXoj8p+4o0A8qT4K9zK3xIV6uN9
 oFj7tjreahh4yHlLG46/8TmQm+QycJCAYkdtFasDPlbRcw2rF398CsaMNHGTLjIZVoOpoyJaOAL
 r+sq9nlRvTDc+J67TU3gXk9e0s2fX7mw==
X-Received: by 2002:a05:620a:318a:b0:93f:54e4:6d43 with SMTP id
 af79cd13be357-94421585553mr3134789085a.6.1793883253267; 
 Thu, 05 Nov 2026 04:54:13 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93f:54e4:6d43 with SMTP id
 af79cd13be357-94421585553mr3134784585a.6.1793883252641; 
 Thu, 05 Nov 2026 04:54:12 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b58c868e70sm148033a12.24.2026.11.05.04.54.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:54:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 13/17] target/xtensa: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:58 +0100
Message-ID: <20261105125203.40320-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec7c76 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rWSpPdxy7J_5Rebl_tYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX6dxuJUWJSJcC
 jq27iJlUk47stJ0b7gSKlX/Cx6F/xZzkUr1IaqpwTTClnTJ/F2J+8ZaSwRncLaJeVa5Nro0J6zs
 woULPTCd2VouAk61n/lzignuUE18nxYvkc6aHcrjTMsPPca7S09BpWPu6XS2sZcOs34c8F7FvQE
 kaxdILN3ukiPzg8LEyQ3wf7V4XAgI3JhsltF/DtbrjyC4Cvdk02JdcLJNJK4akf4MhOTR3b8ETn
 5K1831NQPjrRHwRK+fEesc+KjNOQAp18FiDHowyJJ147HcJp3KoaHtPQIeim43nxSMmvIozEnei
 FSQqMrjhj7ipZaZ39DXpc8PxxAGPMZcRjg8F0wOPNaimkDJ43nDqcfn132DtZL4JkGD4npQUhIS
 FGTdwYBRqMwNymzv4/sMMSuCg/bxOXCAKx99YPMb+emXH3hgWrLwa9tTRD8Y45VrJUbVZe0IdnU
 iQWVVFkSiQLGXa3/9HA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX9aY8h0wYzuJi
 sKJb4uUHjiqLubzwm0tPwSlJrcx5QyTC9jMasfmzqk125ArU0yGAP4KBPgqA8/HfBi8OTMX9x6a
 FQDI2+N9SasZ/dJJYpDscdu4TMu181E=
X-Proofpoint-ORIG-GUID: l17rAhazs-17R6jvRZ8ytPmmYk-Raft_
X-Proofpoint-GUID: l17rAhazs-17R6jvRZ8ytPmmYk-Raft_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to format ISA error
message, silencing -Wdeprecated-declarations produced by
Apple clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/xtensa/xtensa-isa.c | 50 +++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/target/xtensa/xtensa-isa.c b/target/xtensa/xtensa-isa.c
index c564af340fa9..f589a7cffe01 100644
--- a/target/xtensa/xtensa-isa.c
+++ b/target/xtensa/xtensa-isa.c
@@ -519,7 +519,8 @@ xtensa_format xtensa_format_lookup(xtensa_isa isa, const char *fmtname)
     }
 
     xtisa_errno = xtensa_isa_bad_format;
-    sprintf(xtisa_error_msg, "format \"%s\" not recognized", fmtname);
+    snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+             "format \"%s\" not recognized", fmtname);
     return XTENSA_UNDEFINED;
 }
 
@@ -646,7 +647,8 @@ xtensa_opcode xtensa_opcode_lookup(xtensa_isa isa, const char *opname)
 
     if (!result) {
         xtisa_errno = xtensa_isa_bad_opcode;
-        sprintf(xtisa_error_msg, "opcode \"%s\" not recognized", opname);
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+                 "opcode \"%s\" not recognized", opname);
         return XTENSA_UNDEFINED;
     }
 
@@ -692,7 +694,7 @@ int xtensa_opcode_encode(xtensa_isa isa, xtensa_format fmt, int slot,
     encode_fn = intisa->opcodes[opc].encode_fns[slot_id];
     if (!encode_fn) {
         xtisa_errno = xtensa_isa_wrong_slot;
-        sprintf(xtisa_error_msg,
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
                 "opcode \"%s\" is not allowed in slot %d of format \"%s\"",
                 intisa->opcodes[opc].name, slot, intisa->formats[fmt].name);
         return -1;
@@ -809,7 +811,8 @@ xtensa_funcUnit_use *xtensa_opcode_funcUnit_use(xtensa_isa isa,
     CHECK_OPCODE(intisa, opc, NULL);
     if (u < 0 || u >= intisa->opcodes[opc].num_funcUnit_uses) {
         xtisa_errno = xtensa_isa_bad_funcUnit;
-        sprintf(xtisa_error_msg, "invalid functional unit use number (%d); "
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+                 "invalid functional unit use number (%d); "
                 "opcode \"%s\" has %d", u, intisa->opcodes[opc].name,
                 intisa->opcodes[opc].num_funcUnit_uses);
         return NULL;
@@ -825,7 +828,8 @@ xtensa_funcUnit_use *xtensa_opcode_funcUnit_use(xtensa_isa isa,
     do { \
         if ((OPND) < 0 || (OPND) >= (ICLASS)->num_operands) { \
             xtisa_errno = xtensa_isa_bad_operand; \
-            sprintf(xtisa_error_msg, "invalid operand number (%d); " \
+            snprintf(xtisa_error_msg, sizeof(xtisa_error_msg), \
+                     "invalid operand number (%d); " \
                     "opcode \"%s\" has %d operands", (OPND), \
                     (INTISA)->opcodes[(OPC)].name, (ICLASS)->num_operands); \
             return ERRVAL; \
@@ -938,7 +942,7 @@ int xtensa_operand_get_field(xtensa_isa isa, xtensa_opcode opc, int opnd,
     get_fn = intisa->slots[slot_id].get_field_fns[intop->field_id];
     if (!get_fn) {
         xtisa_errno = xtensa_isa_wrong_slot;
-        sprintf(xtisa_error_msg,
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
                 "operand \"%s\" does not exist in slot %d of format \"%s\"",
                 intop->name, slot, intisa->formats[fmt].name);
         return -1;
@@ -974,7 +978,7 @@ int xtensa_operand_set_field(xtensa_isa isa, xtensa_opcode opc, int opnd,
     set_fn = intisa->slots[slot_id].set_field_fns[intop->field_id];
     if (!set_fn) {
         xtisa_errno = xtensa_isa_wrong_slot;
-        sprintf(xtisa_error_msg,
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
                 "operand \"%s\" does not exist in slot %d of format \"%s\"",
                 intop->name, slot, intisa->formats[fmt].name);
         return -1;
@@ -1050,7 +1054,8 @@ int xtensa_operand_encode(xtensa_isa isa, xtensa_opcode opc, int opnd,
         (test_val = *valp, (*intop->decode)(&test_val)) ||
         test_val != orig_val) {
         xtisa_errno = xtensa_isa_bad_value;
-        sprintf(xtisa_error_msg, "cannot encode operand value 0x%08x", *valp);
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+                 "cannot encode operand value 0x%08x", *valp);
         return -1;
     }
 
@@ -1076,7 +1081,8 @@ int xtensa_operand_decode(xtensa_isa isa, xtensa_opcode opc, int opnd,
 
     if ((*intop->decode)(valp)) {
         xtisa_errno = xtensa_isa_bad_value;
-        sprintf(xtisa_error_msg, "cannot decode operand value 0x%08x", *valp);
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+                 "cannot decode operand value 0x%08x", *valp);
         return -1;
     }
     return 0;
@@ -1186,7 +1192,7 @@ int xtensa_operand_do_reloc(xtensa_isa isa, xtensa_opcode opc, int opnd,
 
     if ((*intop->do_reloc)(valp, pc)) {
         xtisa_errno = xtensa_isa_bad_value;
-        sprintf(xtisa_error_msg,
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
                 "do_reloc failed for value 0x%08x at PC 0x%08x", *valp, pc);
         return -1;
     }
@@ -1218,7 +1224,7 @@ int xtensa_operand_undo_reloc(xtensa_isa isa, xtensa_opcode opc, int opnd,
 
     if ((*intop->undo_reloc)(valp, pc)) {
         xtisa_errno = xtensa_isa_bad_value;
-        sprintf(xtisa_error_msg,
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
                 "undo_reloc failed for value 0x%08x at PC 0x%08x", *valp, pc);
         return -1;
     }
@@ -1234,7 +1240,8 @@ int xtensa_operand_undo_reloc(xtensa_isa isa, xtensa_opcode opc, int opnd,
     do { \
         if ((STOP) < 0 || (STOP) >= (ICLASS)->num_stateOperands) { \
             xtisa_errno = xtensa_isa_bad_operand; \
-            sprintf(xtisa_error_msg, "invalid state operand number (%d); " \
+            snprintf(xtisa_error_msg, sizeof(xtisa_error_msg), \
+                     "invalid state operand number (%d); " \
                     "opcode \"%s\" has %d state operands", (STOP), \
                     (INTISA)->opcodes[(OPC)].name, \
                     (ICLASS)->num_stateOperands); \
@@ -1279,7 +1286,7 @@ char xtensa_stateOperand_inout(xtensa_isa isa, xtensa_opcode opc, int stOp)
     do { \
         if ((IFOP) < 0 || (IFOP) >= (ICLASS)->num_interfaceOperands) { \
             xtisa_errno = xtensa_isa_bad_operand; \
-            sprintf(xtisa_error_msg, \
+            snprintf(xtisa_error_msg, sizeof(xtisa_error_msg), \
                     "invalid interface operand number (%d); " \
                     "opcode \"%s\" has %d interface operands", (IFOP), \
                     (INTISA)->opcodes[(OPC)].name, \
@@ -1337,7 +1344,8 @@ xtensa_regfile xtensa_regfile_lookup(xtensa_isa isa, const char *name)
     }
 
     xtisa_errno = xtensa_isa_bad_regfile;
-    sprintf(xtisa_error_msg, "regfile \"%s\" not recognized", name);
+    snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+             "regfile \"%s\" not recognized", name);
     return XTENSA_UNDEFINED;
 }
 
@@ -1369,7 +1377,8 @@ xtensa_regfile xtensa_regfile_lookup_shortname(xtensa_isa isa,
     }
 
     xtisa_errno = xtensa_isa_bad_regfile;
-    sprintf(xtisa_error_msg, "regfile shortname \"%s\" not recognized",
+    snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+             "regfile shortname \"%s\" not recognized",
             shortname);
     return XTENSA_UNDEFINED;
 }
@@ -1453,7 +1462,8 @@ xtensa_state xtensa_state_lookup(xtensa_isa isa, const char *name)
 
     if (!result) {
         xtisa_errno = xtensa_isa_bad_state;
-        sprintf(xtisa_error_msg, "state \"%s\" not recognized", name);
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+                 "state \"%s\" not recognized", name);
         return XTENSA_UNDEFINED;
     }
 
@@ -1555,7 +1565,8 @@ xtensa_sysreg xtensa_sysreg_lookup_name(xtensa_isa isa, const char *name)
 
     if (!result) {
         xtisa_errno = xtensa_isa_bad_sysreg;
-        sprintf(xtisa_error_msg, "sysreg \"%s\" not recognized", name);
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+                 "sysreg \"%s\" not recognized", name);
         return XTENSA_UNDEFINED;
     }
 
@@ -1626,7 +1637,8 @@ xtensa_interface xtensa_interface_lookup(xtensa_isa isa, const char *ifname)
 
     if (!result) {
         xtisa_errno = xtensa_isa_bad_interface;
-        sprintf(xtisa_error_msg, "interface \"%s\" not recognized", ifname);
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
+                 "interface \"%s\" not recognized", ifname);
         return XTENSA_UNDEFINED;
     }
 
@@ -1716,7 +1728,7 @@ xtensa_funcUnit xtensa_funcUnit_lookup(xtensa_isa isa, const char *fname)
 
     if (!result) {
         xtisa_errno = xtensa_isa_bad_funcUnit;
-        sprintf(xtisa_error_msg,
+        snprintf(xtisa_error_msg, sizeof(xtisa_error_msg),
                 "functional unit \"%s\" not recognized", fname);
         return XTENSA_UNDEFINED;
     }
-- 
2.55.0


