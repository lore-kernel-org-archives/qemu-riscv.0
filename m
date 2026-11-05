Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E87606A336
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dO6ij7Eq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akuwBDBg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOx07-0005qX-6R; Thu, 05 Nov 2026 07:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyV-0003h9-2Y
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:59 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyT-0005py-Lh
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:50 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tWlK433424
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OF1920oRRrnVJwyvR3UnD9uFml4Mh2HOqZa4NKLWuXc=; b=dO6ij7EqxG5Fip7w
 N0X4M5ByjWycqk442isgUBZKyMVkOM5eQLM1QJG2ohGcfhSMuD0jazea+NU2xC6L
 Q/EZvuumAFroAewkNSY+lRP9X6x0xtyvFCoW/x//07F2dsAlvX8uxQuIqMPMZ404
 6PBLy6PEvJC2gqO875k2s7A3fnoH0BzTQEuTYed5L2Zp30/7xShJVdW2c6NAgb3k
 eA8UUbMCQpqg2vH3M7Jrx/jVgaxtlE6KYnmqXQoRXNgONZJ2aQl11Lf5YZwT+2pq
 zWnt522f/v8nzQK8HjGCF3GNvLaFRSiGalaXrjAL8MJb4hV5LMLvIZGTgBdtClm9
 CW3Paw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd9keh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:53:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f3969a2a7so348486585a.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883228; x=1794488028; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OF1920oRRrnVJwyvR3UnD9uFml4Mh2HOqZa4NKLWuXc=;
 b=akuwBDBgQu+qv3Nt+96kxn9YgToZK6y+JR7BgChI7YW/mRLIMYBU5gX7OcglY/nP7j
 oxZm+6IQ+tDfyK+fc94vzOXB5nRhUUJ42x3uS0aTYGatZ91P1+G6Rq0e3YnVfAecVUwj
 m4XRyHEuiTepVQEwzOqKuVirjpEQWeorVfCe5Ymm6VaRnHTo+cmvZGlZQWmDKGq1jQKi
 Q/byPEC8CRmbZsAmoghHdY0QGZb35tJZm8JYsRGZRDg63+Ypygxe5AwHp9YLqOEaF/wT
 WzTlL15NmlAzI/DWmmqKQ2vczJ11n/WAnl/TmDPM4PDaKva1ymjJlm6u9Tym8dwxSJmG
 yKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883228; x=1794488028;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OF1920oRRrnVJwyvR3UnD9uFml4Mh2HOqZa4NKLWuXc=;
 b=l1QcRGqevMuWMr7iJixLoF1VOSPTuEZvp9rZHKkwNpIh2/ht3ktfjMtH/9vAqlJEfl
 9Jxo2vuTlfGmmDJIPb3p2/ZwGV1Tn9Vn2PtdSiXWPEnB98EWUhf4ViEajkXj8xqxQ7tZ
 He8ZahQKswIo++9aBgxrOYPnMAsuptEgnoh8OqfCLWBNvqNdzyOMO6pl4hnNj7Fn5Wci
 RbQeR1kMhpwbz9cU36Em7iDtt7Ve8rvdyUkQZvNHlW2P6BAk5K3bjjEV2tffrihhnHw8
 xI7TfX5Stx/GWmUWMPuiOfgO3CplndgDmXimwybrmQXe0WEBixoPs20HYai2nrDToFri
 SrbQ==
X-Gm-Message-State: APuU4Z9cRK6j+N1OkqqLQA9lJJjdt/3jd9eBqQIiNZvlmbXnsIOp+hA1
 hRzxEA+vPEdFUOGaqTe3at/fFAJwNMdE00the16ykP6B51hBpZBi/88C+t/uMfvOwqAMr/Apfty
 QzaqC4A6Nd55RZ6Y4TDCXKf8EmO1DR/Kzw2YZDCpjbsyIy420ueBrU0GyquwD9MJ2ag==
X-Gm-Gg: AYBFou3bjcBXEaz+YF+Lv+Bf/tPanKQbtm2OsAmzx6R38Z4ZqB+fD7wy7hzxhGkYsEj
 OrsBvcd0yryn3lWDdZ4+AU4RMqNEwspIqdJSWzsNFM06tEOY+5wUg67COTCalWwlru8ZQWFI9zb
 Yk9uVWUZDpa2xVhIiA/ltGaqZdKDFbsvW8syQnbDA33TOK5d4Rs/lHwFo5ZPx5zDVDjqAqDr3JR
 Y55G66BuHULV6rezs0+QZPskhklyup9bunvmXkWFjelmj/Hr6Vc1gas0GfiUko3XtmsKH8pYoA7
 TppipEr2cG0k4X1rs07UzTLkdFfyjHW4oNhqFAg+L/H9tER6BHr7Js2J1p0Vgqh0bMyxBqRAxvL
 nJE80lA1ppVl7uW+pL9VyVS8JiD2vxTbBs32R0HrIacjTp7UuIpA1Z3MWg+YMTZPsGl5MQU0MLC
 0Jt37mVyHA5rlmqha0rocAk4utWv5drg==
X-Received: by 2002:a05:620a:471e:b0:93e:3824:4123 with SMTP id
 af79cd13be357-944216fef10mr3362081585a.65.1793883227519; 
 Thu, 05 Nov 2026 04:53:47 -0800 (PST)
X-Received: by 2002:a05:620a:471e:b0:93e:3824:4123 with SMTP id
 af79cd13be357-944216fef10mr3362078785a.65.1793883226954; 
 Thu, 05 Nov 2026 04:53:46 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0ddcfa78sm172214766b.0.2026.11.05.04.53.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v2 10/17] hw/net/eepro100: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:55 +0100
Message-ID: <20261105125203.40320-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec7c5c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3I_bySaw9zVCgE-qlKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: t8jXqbbEYnPGpuaR3yRIYCV4FQj2Jpfq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX/fKUjJr3c89V
 KkIUoCyP2sMCQf0K4kUIdpBSfDLqePSeiBqxuhNTc622QYMAHnwV/tboqR0I7l4knZSnZlDJEmU
 Il4E+irBVRohQnLNrTB8HbzywLcYGmQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX3TmkOWzpCz4d
 pEs7PXeClMR73a1a+JvF+1A13bABfFAFTkwbrjGXzsOgQ0GS2npVuFgVeg7nYSVwdN9HjvoSFLF
 BP8PaOh/uXrMci9fsGUJrKcF6jPN86npRd0aU1HfLcGvXWQAXATUqO2onOOLs+57HzAzSiIoZjw
 jvpio9YZfDC7FYCpymmsyFl/jveu4L9PArotjB6FE3M5b1R0KeI74L8FoHltxBO1fP494l8N6Ni
 cPGJW1Szf8NcpTnhd6NV9xCKwt5eiBRM6v5IyYJ63N/XDSIJUSL9/3NDaOsnyKUg6GSgVqp4lfi
 mKZIgKZcepJe03bBJxgaKpC60Inev7uOdRI315jpUFpV6azKdqTJk5c5ArOebMonarawz8kV09j
 dm2ta+amA7U3eyPgqGftaZRI3Hk+CwUQv/lAN7S8Q6zaZtYi/ZBwy1YX1JJrRwpqWnUa2ZW6FhU
 T46B4Ht3v1Eqs7I9HQQ==
X-Proofpoint-ORIG-GUID: t8jXqbbEYnPGpuaR3yRIYCV4FQj2Jpfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to format debug dump
silencing -Wdeprecated-declarations produced by Apple clang
17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/net/eepro100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index aaa3eb60f8ab..44eff5fd3ad8 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -369,7 +369,7 @@ static const char *nic_dump(const uint8_t * buf, unsigned size)
         size = 16;
     }
     while (size-- > 0) {
-        p += sprintf(p, " %02x", *buf++);
+        p += snprintf(p, sizeof(dump) - (p - dump), " %02x", *buf++);
     }
     return dump;
 }
-- 
2.55.0


