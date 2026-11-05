Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DE606D824
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jUPSJO8O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OoSWPQLS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOwxG-0002nT-O9; Thu, 05 Nov 2026 07:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwx9-0002lA-49
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:52:27 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwx6-0005gV-LU
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:52:26 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tWDa406831
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=; b=jUPSJO8O1y0C8NHF
 EtCQNNbeWuqp8zXBnVjoH8e0htP6EKxRyy5Bk5sWH/F6xdgBUMXAUam0/O0t8TQF
 F8Hipbz9XVSFOhT4s4J/1/60tyxL434sGq+/CnEiLJmu+IN5Bv1bd7VCYjR39s71
 pZSjOLRHBGWY0GRTOZAWiAbBuj4s0ZabQr1RX4QUc7I7QOl9DlMA12B/BZv+fzCQ
 Lre1/oAybApC2rtlwWwSz48bWKZWff0snjQ2MassDrm7yNorp9XQc5P5lkvP7HFH
 PJyXVdjVT1S6yLhTpVYYrCrg4FEntWLjiHfbzHrTIQ3TbPH1/p87oGKozPqNsR7H
 fThk4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v1m0k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:52:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso274541085a.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883142; x=1794487942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=;
 b=OoSWPQLSvULiMO8C5Y0y42yTqlrVEiqw/eJFod7aL35I7pcrg05toydullfZqtlyVg
 lnrS0XifiWcc+M6UD+7bqiI278Lqk2+nHGlSeIpbef4GVbAVH10AgOwzQnb0xF+a3j2g
 9uRvU9AAPwJ43KcfOpPTOxov7ffU2nOktckSoKOi+1uJEtkKA7PvbZo4EaNubyx3uc4k
 Wv8/kShPaswuuNALfxaCrJ892rUZAA7xabOUjTsbz8IohfTHV0cymU8AHFcpb7wFQixe
 kWZ0cp2wtoZ2I74dtJVlTWr3koutEOd3LZ/HxiJ+B6qAAarQv78uD9THVK1INQSeard6
 dkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883142; x=1794487942;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=;
 b=TTwcnt5m4yohs12kT+wVp54tsknZtYVnKmbNbTTdfSSAR33JpEPin4My+Jd23NBb7k
 vWAb83IgpLnfmB0ye/dt/PGuP9vvCrzFMan/EzPmC4XVhjIza1qJGr7DmPbzaVeXNnpG
 ++s6TO1StK2l/EdHtcduKfwIyaXY8ero0cQeC+LCBiXwQMDU0JLhZ284jB+o9lwM3j3p
 SXzEawobaArBzeKN/qkxpsY+lm2xPAoRmqRBXkCWQNeJJYNY37i51wXqOyqOsNE53cDy
 lpl0KODYEEUV85UStLwc8mMgeHCPYCkm99DiALBY4ZZAOuDyrwMR+KlaQGFA7j7xubSU
 IOmw==
X-Gm-Message-State: APuU4Z/QgH3xB+2ShidsDW4+QRVuifcRtIh4hgTamk1GZ40wuFOsOzG8
 MHltY7GtrYyVxk/Kpb+1OQz34EZLpBrRyrrpgjHeXWZGL+OIi3/Radvov++gvB309xAWGZAP9uJ
 FkWdMQYCwZnwqDe4Xl+BZcXupf9diEKhpkMn17hIcPQ1XG2M8MCecRmPcpQ==
X-Gm-Gg: AYBFou3NdhrvGOcFh4nTR5NspdEYGvmRN81aeSAibOjYbrfHMXhxw3bsyzrq5P0TjFU
 nnjrq5lcSF/qBf+dH3nrTSbsCzd4ZYvOwhlM1R03cijU6Ml++/OX1XmDtkA1mB62YBDbx/HeZPD
 a3iQoxoi87ROdpUr4sdMgc4Ti4LYIHHLkIJdSYvtRzZG2NqoXwyTSobdG71CxK8lBOShpT1ZAZI
 p2dz1FJsfA73EpOK5yt48/nV25Alz56mvMqG7Bjd3fnSYCKRCC9ERIjkFtd2gKXkyD7PX4QlFM2
 WVN90ZE1n86tPP0JrRlm1Cq8Yq4M/d/eN5UHWnZWEbHZ/7Bqlf3YB9ouYl9E/oFizaVIC/vXJT+
 6ArU/YiMsj5uF5WisEUNAwKov6yX6dUe5hEaZP98kg78C9hv3Z2+7o7B13mG4zmVjnn9qwcQfL8
 DbqAXg44oZmKdDM6mVxtynRiBMyZ4iIA==
X-Received: by 2002:a05:620a:414f:b0:93f:1e3c:4a3d with SMTP id
 af79cd13be357-944216ea174mr3173723785a.46.1793883142220; 
 Thu, 05 Nov 2026 04:52:22 -0800 (PST)
X-Received: by 2002:a05:620a:414f:b0:93f:1e3c:4a3d with SMTP id
 af79cd13be357-944216ea174mr3173721285a.46.1793883141780; 
 Thu, 05 Nov 2026 04:52:21 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e42479dsm172396066b.17.2026.11.05.04.52.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:52:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/17] tests/qtest: Use qemu_hexdump_to_buffer() in
 qtest_memwrite()
Date: Thu,  5 Nov 2026 13:51:46 +0100
Message-ID: <20261105125203.40320-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXzYGOWkBfVpiz
 AmCWVY3rmxnrJkRdkQzvnos+kTk7ID36iMOpjttez/O5RV/kzLeJvgbgBqhgRNp6mcKUYOI3ftU
 CWUAYW/umZC0pHFqjo45zKzEY8d8/V8=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec7c07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=k_a3swXMNwr4Ts-8P3MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX/vSJ9f70L4CI
 8ee6ct8D9TfmuG+WBx6StoPhIZDRqalMBg0fKrzIvwm/bdqtjNr296duPwEXO0RNc7w3CBYiiQt
 g9cnu2UnUU5ZIGSXLnoBrVzHjeqbZBOyKT1eald/MuxP7psauOOvNxTcXFv78Wc36AEH9lN161v
 6Dr3p8TpbDCeUQAWk9OsuqhJr/JpTj7XfqT4YOhrATRElLhqvCuMYbpkakze3o153FtRWRP+qjE
 TkIWvE3fa9XUwl9yF5MuTY93NRjJ1KPs98BK9pAA4HiEqMqfQ4Vq9PCKuwXPwIEA6vyiinR9emd
 SmXhhLdY9Q/gdmNlCDZCz//6mafCHu10PP5BxsW+k6wtM9yc/doHmsqgPyZv+fyVROv7vAQGdA2
 9w8hzBlppentbicW6OPQDmI0cg2E8FuP/xY6ckSaPWz4BJL6mHscvxWYtKK4hdm4YAd3ZrZWXha
 2QG0rTBXt9L4Yd/AWjA==
X-Proofpoint-GUID: LJ0DlONDr1IIQ-XCrLDwWTFCfx3Fo06V
X-Proofpoint-ORIG-GUID: LJ0DlONDr1IIQ-XCrLDwWTFCfx3Fo06V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
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

Replace sprintf("%02x) by equivalent qemu_hexdump_to_buffer()
helper and silent when using Apple clang 17.0.0:

  ../tests/qtest/libqtest.c:1522:9: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/qtest/libqtest.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7f66c1bbb3b6..b6b9f8fe161d 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1509,7 +1509,6 @@ void qtest_bufread(QTestState *s, uint64_t addr, void *data, size_t size)
 void qtest_memwrite(QTestState *s, uint64_t addr, const void *data, size_t size)
 {
     const uint8_t *ptr = data;
-    size_t i;
     char *enc;
 
     if (!size) {
@@ -1517,10 +1516,7 @@ void qtest_memwrite(QTestState *s, uint64_t addr, const void *data, size_t size)
     }
 
     enc = g_malloc(2 * size + 1);
-
-    for (i = 0; i < size; i++) {
-        sprintf(&enc[i * 2], "%02x", ptr[i]);
-    }
+    qemu_hexdump_to_buffer(enc, 2 * size + 1, ptr, size);
 
     qtest_sendf(s, "write 0x%" PRIx64 " 0x%zx 0x%s\n", addr, size, enc);
     qtest_rsp(s);
-- 
2.55.0


