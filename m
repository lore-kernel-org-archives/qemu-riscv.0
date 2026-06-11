Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCB6CD98CF
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 16:23:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXiAy-0001my-LT; Thu, 11 Jun 2026 12:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXiAx-0001mj-Gs
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 12:22:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXiAv-0006aH-Qy
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 12:22:39 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BErv7V943291
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 16:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3ujoPZdqE+D
 UNIoTZmrKeYH519uAQoGPnpFXqAXiS54=; b=LM9gE/RTxmIJ4LUONVD+QAdX91l
 qm2tRIWq3k+lVLQw9E6q2gb7TyAwmf1VYS3M16S9sEu08iLOXUny69CiIjYHJlqj
 DyGBw4Lnu1OrRrUjyzRfB3m6OzhCEVxGbatPSJvXgEjpalZz0woH587uEyXvAwyg
 vLMFuLxHtFwsoUYFaKj8dcp1m18R1pzwcCcIsQl7sYuS6GK9+knCmUWNWk6hytNN
 ScIsEXT+1Aqk5iqm232w3Lt5XsSuTuODeZ00RJkzw53qc4xbf9IGGR1hn2b4eTiq
 MXDW1yYNEfxPHclJ7CIzyq//TT/gvs+UVfDNFJriIYTDfUDSLP9ytYyqpJg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tmg4u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 16:22:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-6c5794db0eeso8368445137.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781194954; x=1781799754; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ujoPZdqE+DUNIoTZmrKeYH519uAQoGPnpFXqAXiS54=;
 b=H4ZvDD1hEdPrWQACVmQSNDVUeANhg6mS4JvPgvS96iRy9z7uXDnkxjDm016DDnNSSO
 YklJ8bPub+iKXDQv8t/+VAlfSeJoMnOF8WM0CpdBMSFM3Cq85LV9Ibx6bQxhrytuLUjV
 kjEDoYmtxEyJInCuM7Y6mkSRSlrnFvE7vNfQc/Ag+J9NSBx4SkepXv+Q51UA0T1fCAvO
 UBBfD3uMn/Swi/vplL/poKxkx6WSLChAmgjWKo5lUkV4OgRIbTxlypUc8227DXIWbQ3U
 t6wTxGcAv9yZ+xYQ70risggaFcBcTpGB+Cw1E4C+wWsRbJvvQLPZEmq0CjB+ts6Z9NqX
 qxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781194954; x=1781799754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3ujoPZdqE+DUNIoTZmrKeYH519uAQoGPnpFXqAXiS54=;
 b=Y/r/t3ZgtOa8EKL72mpv985n8s7T1cOdbm/wgXrRqJfoh+QkLUeopD0uuuSQ2DAYG9
 YLooBc04MyOEp5R9uUQKwlOzWV0tutYVVxjiLwpV5ZnV0mHKwvLkH+k+uD5xEl7qnVqc
 t09m4aHiJW91+svFEJiayuy9bskrQ8iKR6GsXzzb6NAdV2fhL+HI0YgyxtdinZz4Fe1l
 TV4B3HFVoNvBQeNz6U6WM+8rUpqP7D/uuRfhCD+6Qzv+4WySbrrjjQZXUBZLDFOOsyX/
 Jb9+9YqbiZdbk8iq4hiwZXUeBuBErogW9vVP7AkfM0asZg4mkrnkONvnE3Al4RlL+rxe
 ucoQ==
X-Gm-Message-State: AOJu0YxtxNzoBBU7/em71w45jleIJbyQwdWxDZwhi7CF4ZXhBf2F/CwZ
 H1S81QUegRtcQz6l18Idw0WyI0cM7co/VbcDdtV0FEfShiAUqr4Vxxg9QAD/URH0rGWYRnyvzQ7
 LWaE876f4emjekZJ87iY5Ewk8G7kSCaFeLTf8gjX8MmzTh77D11365zhJCA==
X-Gm-Gg: Acq92OHcuYyYWPdR8enAj+izHLZzf6soaogKkYqlx3GZJd5EwVK//DwugGJDIcvtIVX
 IkEitLizA2HKvVNJLMS+42/3ntdYGdCexq3Bu1EvF5/Pvbt51caZFuhok4osQ3BoHGNbWeRDkmR
 B3OncH5Uptmp39I1c6QJTZxto6Rx3ZPiFnn6EAtAdIKxmkBsPK9UtnvkKNPtV3mMCpZnucxSHel
 ZfcjcN0WsIhcAwv6Y20A39GvWYX7GPKflXpak/adaq1ev80BRRD4nXE0pSSWBsmiArZhG4w6SGH
 7HJlmlaVLz/N9ne4RlsKzzLpzAeOVmjhdd6PhuZ7nycBCSzx1Ah+igarE5qXpAS9HQoEP6Iw6BC
 zfylktF8lERyONXKM/tMX79MvNFIAF07/U69Mb7+XbwJAQN8y445Xp05l2/c=
X-Received: by 2002:a05:6102:50a4:b0:631:4580:6a33 with SMTP id
 ada2fe7eead31-71d5ca70b3fmr2345166137.21.1781194954647; 
 Thu, 11 Jun 2026 09:22:34 -0700 (PDT)
X-Received: by 2002:a05:6102:50a4:b0:631:4580:6a33 with SMTP id
 ada2fe7eead31-71d5ca70b3fmr2345107137.21.1781194954188; 
 Thu, 11 Jun 2026 09:22:34 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d1eadaea6asm21879526d6.40.2026.06.11.09.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 09:22:33 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/2] target/riscv/cpu.c: add 'svbare' satp-mode
Date: Thu, 11 Jun 2026 13:22:22 -0300
Message-ID: <20260611162223.2361941-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611162223.2361941-1-daniel.barboza@oss.qualcomm.com>
References: <20260611162223.2361941-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX7ImWqOn21vcP
 v2UHIrSCapDpKJI7thgKa72bJQwatVCgYDfFgZvnEcJYJeY16WaR1g3eeOE/Ks7XAWf7+e+/ir4
 wrSxEaWf4GeJJAyiQQ9F7RAQ4tnYGY0ApT/2AM4jpQNT/I41WEWQqmECyE2hbPm/qI+kTA4dBxT
 APg9ljjQNglWmggqIwOJEj4gQttgxkBltqlFf6AyS9iIFQftGfrsd3jcIbrq0Nbp9HyXrd3eSO/
 BWDZbiPTxk0FcQO2lDvHpp8mfxPghZwGZ6/Ut46hlgEE2nOnVWmUOGCWH2H2YJM2aqhCZZfI/XE
 /wl+ttBllH4R7tJAViVJ+jUGWmiQXE3VePd18WKL1cGKJTibH8REK76g7/Zu3lOgnXKEVmEFHl9
 kvWau6IqCmOrMuG9/bpQFjiQ9yaPCTjfSrTuPH4oSyJw1odqS72LOfIgu2uQ6Ip4c0kjJpO8MWj
 Jf8JqTe0ZLUQ/XhxGBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX0a4utsjk/Kq2
 LPK0uLfrd6uGIl0PYVhWZFXa/gwhJJWLBoYCWh1ivowhm11AlLoTAaONGV9p0FAXLUuFt8JhXVR
 rvSSMdaZlgvWhKM3J7NcZeRvzJp59s8=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2ae0cb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0YmiQVT_MXrfFZhh7UoA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: RyCQWtAFViBF3Xj_c70uZWYf8lDH4KLd
X-Proofpoint-GUID: RyCQWtAFViBF3Xj_c70uZWYf8lDH4KLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110164
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Seems like we forgot to add a flag to set satp-mode=bare.  What we're
doing instead is to set the CPU default satp-mode to 'off' to set it to
bare ... assuming we know the default satp-mode.  Otherwise one needs to
do -cpu X,sv39=off,sv48=off,sv57=off,sv64=off to get a bare-mode CPU.

Add a flag to make this process easier.  The name choice is based on the
fact that I didn't find many references to 'mbare' in RISC-V docs, but
'svbare' is a flag name that toolchain uses to set satp-mode=bare.
Might as well use the same name to help with cross project compat.

After this patch:

$ ./build/qemu-system-riscv64 -M virt,dumpdtb=fdt.dtb -cpu rv64
$ dtc -I dtb -O dts fdt.dtb  | grep mmu-type
                        mmu-type = "riscv,sv57";
$ ./build/qemu-system-riscv64 -M virt,dumpdtb=fdt.dtb -cpu rv64,svbare=on
$ dtc -I dtb -O dts fdt.dtb  | grep mmu-type
                        mmu-type = "riscv,none";

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1b10cc7ef..d968daa404 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -421,7 +421,7 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc)
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
-    if (!strncmp(satp_mode_str, "mbare", 5)) {
+    if (!strncmp(satp_mode_str, "svbare", 6)) {
         return VM_1_10_MBARE;
     }
 
@@ -1053,6 +1053,9 @@ void riscv_add_satp_mode_properties(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
 
+    object_property_add(obj, "svbare", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->satp_modes);
+
     if (cpu->env.misa_mxl == MXL_RV32) {
         object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
                             cpu_riscv_set_satp, NULL, &cpu->satp_modes);
-- 
2.43.0


