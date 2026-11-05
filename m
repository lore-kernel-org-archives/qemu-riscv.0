Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95560606A326
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NB+TRIES;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HcvMEp1E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOwye-0003cY-WE; Thu, 05 Nov 2026 07:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyG-0003QQ-OI
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:37 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyE-0005mq-LJ
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:36 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5AhvKt1582949
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7oSR+J5qW1aMzh2dYDYU1Jy0t1xB9T5XHm0AYD77RFU=; b=NB+TRIESuEE3GoEg
 F2YUNZRB/dF7bb5HIQRuRdKwOn+AfUi7Qi4QP1+F1xYh1UxF+qaCA6LFup42+8m+
 TUbAzVIOQekb1To5WQGiiI9chGZTJpxtOwxETp0BNhPfNbLNxU8hYjKhT5KrRaMz
 fBhdnUZ+9w5qF0eJ4gsCEZHDlHxCHNoF6czc/A0asZ/WFeIdg8Vp5WOZF3TtRNjo
 CirFXT26OxhMD9vTCADRhOZ1hTMgj4nhf/fbNAimQFKYCU3Jh09splE8ONMz6efj
 FGAzT9y3V9l/zMcxfEaPIxrXRS+86D6rnSQRhUbPNbIyzYz/O26/mCf37nL3JANh
 pEA2oQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraargrq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:53:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-944101e6367so123651085a.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883202; x=1794488002; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7oSR+J5qW1aMzh2dYDYU1Jy0t1xB9T5XHm0AYD77RFU=;
 b=HcvMEp1E39W1+d9KseCl5goNrRRzBtN6XUiy17WSWZtiD54fD8YKfIh8mqKYUCtp0z
 rT64QrdTdTzICajcqYLaqJ8iOWwAT0X4nT8c8qlOkPTxFbQRse6jYgFTWs/ZbzYzgHWt
 E+wweQiClKKkx877KHh4Ybz6VtZzKjCbI5Wu2pm1/br0B+yMxUzcvcSTDKph59+plRAc
 GtanKzfgMLBLp/HW62MHcihRAFgtszrKii28MGoaQhCxKb2uM2dX+RGT/oqSEUXG5mie
 ppO2QBmnzilP4AiGSqGEhk2XOr2ON935/3Plwkhc9v7KVXfVE2aJVUoTnHl1kqwQFYmu
 7wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883202; x=1794488002;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7oSR+J5qW1aMzh2dYDYU1Jy0t1xB9T5XHm0AYD77RFU=;
 b=O6UXh2Nm96FkPwWcFVlghXs75M10Ny+UTscMgmKGgLqvT6q7UPgbXTRjhtNm+nmZLm
 TvlJzQkzkQqPI+s/vu+TyjUal3/nW7oIKNcb4+wG5Gog5VpbLYDsI8KzYWAL9spxnZH4
 3HpEglAwOytOjn9dmbRHHFdUXRlMDVyGmVDv+30khRnqwVnP54/rbRBBVPl2QR2qbti3
 f/Tb3/2pX2AsZQkl/hv8P/rFaNk0zcwarZQKIxaxsK/Dus+nMeEnmH/OriindcVEFIZG
 iW4PyubYR+4Nez14R/FZBZzRFe5l0BoYQz9dN2i6PNPevky62K9U/TCl1Fb23yM8G3eD
 jFPg==
X-Gm-Message-State: APuU4Z8hloqQDmUWvXBjgyvneRdMiI1ALOJyDneogz69ei/Ajcilvuo3
 eDfZejC+H0s5nqRZFWnNt8j21AXiMPASfCZqXpkulLN2TYr+vjvn+IEbr90IypKLvlD5zdNurm1
 rDphshKFoHcPPcmpbbpxWhW4nY35zyKzrh9AoINxnA161ResPqFozp3VeIA==
X-Gm-Gg: AYBFou3wb0YI99ABIq7RwnmflaPSJm4NmfISd03PgwM8XYL4DSWkFnJItOXaXieCHJu
 DaP/GCwEtGda92Bl+8LV7mmKW6Azlof1h+18Jpv7xorW9PN1crKKKscURDxuQh95EVvCXYKCGiH
 px9begTnrMMFhR5DdKtpbgXX9O3AYoU7U31147NoQj/5PP9bz85jexdgV19/yk+eg0XD2r8EE2a
 6N2metN1JeksxLIOBtItPcpMYXl7O70oSPfn0kUd64NEUD+FFKjJ71Iw91yZoBlsgPW87P6bf8r
 DcgQI5q046cZ05gol9qEkIWwwf+j9vXJFdi+v5vUwgSJo1XrwOnC+hFRG/O9GA6ggSOueiZh3W3
 RFs48EhWKN4Xg4cXCddT9ksqVDPmmnQAcSxV8TWu38oY1DF3nTxslG3PYcvZqDJ5dPFWUJmTNWi
 B3pj8m3bBMzokVVZ65EimyvF5CyMPovQ==
X-Received: by 2002:a05:620a:1d06:b0:93c:5952:5765 with SMTP id
 af79cd13be357-945e1593c89mr394155385a.6.1793883201921; 
 Thu, 05 Nov 2026 04:53:21 -0800 (PST)
X-Received: by 2002:a05:620a:1d06:b0:93c:5952:5765 with SMTP id
 af79cd13be357-945e1593c89mr394153985a.6.1793883201437; 
 Thu, 05 Nov 2026 04:53:21 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4a7677sm166255966b.86.2026.11.05.04.53.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v2 07/17] hw/riscv/platform-ref: Replace deprecated sprintf
 with g_strdup_printf
Date: Thu,  5 Nov 2026 13:51:52 +0100
Message-ID: <20261105125203.40320-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0R63VgEu+s2j
 UzmMVHR1futuIdaFmAZSnQtNz/ayRCehXBuuFIrGHJfnyuBj0/p55ycNFYx26isd4m5oOFWl2i3
 72vC2roRdHXOrlG9iaqrAUgRJBDnwus=
X-Proofpoint-ORIG-GUID: q43Ut2F2pMiFQhwTui-6bfBWCFWBhhwB
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec7c43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R3ryGEeKXBx8QBJlfjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX7q5lCu1Tbnhi
 yn4TrF9RNZcBO1UFZyzyVMgNh20auXNVfeXYg3BZpnwr/cVWUDgX0aGPG+VxEYmzwFPipUeJjl6
 VuiqgdLYYolboKpbRezAsuuJpcQ5i/H7ca2XYUEuX2vUhC5n8tZjpqJ8q3oCZWfL0YAsuouNJ7q
 O13Cc9J4VO+ftnX9uRx6P24A3qrvcsIg8GP5VTkhpx8KAk1+Pxg6UEIsv6qmaGyHlGal/Y6VAZU
 ZGT6j2IbsXD7s8pxgeHj8GcVs4io2ajINrpf1heIp1JbqD0vHf+eYq/tsOCVtdUxaSIA5clD1E5
 MZ5cOXTqklcydIKhAEp9Lmsme/Uv0AZoQGmXMqKKbAG1pg8EFP5yVtIMO2BWLl+PqtOiLWgqqLb
 4K61v0LCq+eVg0I0gw/3K6cVfFEnrTMZvucWl0C/0mufU8fi+5espRX/igO2cXTvi75y/L8dyxH
 Ot0fO6NAwMt7NjROTXA==
X-Proofpoint-GUID: q43Ut2F2pMiFQhwTui-6bfBWCFWBhhwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace sprintf() by safer g_strdup_printf() to format the AIA
guest count / description, silencing -Wdeprecated-declarations
produced by Apple clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/server_platform_ref.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index 5f485b1c79cb..d75bd1465a43 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -668,10 +668,8 @@ static void rvserver_ref_machine_instance_finalize(Object *obj)
 static char *rvserver_ref_get_aia_guests(Object *obj, Error **errp)
 {
     RISCVServerRefMachineState *s = RISCV_SERVER_REF_MACHINE(obj);
-    char val[32];
 
-    sprintf(val, "%d", s->aia_guests);
-    return g_strdup(val);
+    return g_strdup_printf("%d", s->aia_guests);
 }
 
 static void rvserver_ref_set_aia_guests(Object *obj, const char *val,
@@ -716,7 +714,10 @@ static void rvserver_machine_device_plug_cb(const HotplugHandler *hotplug_dev,
 
 static void rvserver_ref_machine_class_init(ObjectClass *oc, const void *data)
 {
-    char str[128];
+    g_autofree char *str = g_strdup_printf("Set number of guest MMIO pages"
+                                           " for AIA IMSIC. Valid value should"
+                                           " be between 0 and %d.",
+                                           RVSERVER_IRQCHIP_MAX_GUESTS);
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
     static const char * const valid_cpu_types[] = {
@@ -743,8 +744,6 @@ static void rvserver_ref_machine_class_init(ObjectClass *oc, const void *data)
     object_class_property_add_str(oc, "aia-guests",
                                   rvserver_ref_get_aia_guests,
                                   rvserver_ref_set_aia_guests);
-    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
-                 "should be between 0 and %d.", RVSERVER_IRQCHIP_MAX_GUESTS);
     object_class_property_set_description(oc, "aia-guests", str);
 
     assert(!mc->get_hotplug_handler);
-- 
2.55.0


