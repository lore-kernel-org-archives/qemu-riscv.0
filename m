Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA52ECA5FC5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:46:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xByMo-00062x-FF; Wed, 30 Sep 2026 13:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByMl-00062W-0U
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByMj-0000oO-FF
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:14 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHexSm480240
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=a1o2Asq+Cn5ZDjJfxv1jHY
 9y7YTe4JwqPzOAx1j+Wys=; b=D506kot4C4kPU+aT8RxUDl+/VpnbbhqntT7W8H
 7a8ReudEdBJD+zf6pQse5DWG8pwpcRvtq2VtTOiqA4OuxCnhTtp7GjJDUUdai4T7
 oA5QyOf2d2V6oSpZ7umEMIRhj+o8oA+8jzY2WNoI0YIWgWqoC53QqTt+LbbbOEho
 Dz2ILDSiTjb4G7wvEC+DAcX3RZNqVDU3JLpu4txA7c3HrFE7T5uQ5S0LNggJXbjI
 YIJSes3LIpcbTjUJdWw9XgR5Q9OZ5O7kN7/97zNxKq28tjhtECaLV17azOoWVFYM
 93JeNzbB+kt3PjPuHRurfbW/yKWfMmDVBtmTmQM9F+rs1NYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h155vrm35-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93c444b438aso1208347985a.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790311; x=1791395111; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=a1o2Asq+Cn5ZDjJfxv1jHY9y7YTe4JwqPzOAx1j+Wys=;
 b=bZ3avKQS1KJ4BtWbpGBn8FP/TUzagdQNMMZG8+EjrRmJUXAdKPf6iJlJDYMo1bDogr
 1wCXplBmoajVBuepHHuR3kAZukdZG3GKeDorALoVPF/94S3sNiATQltuJXpUWDV9TvMZ
 EmMc4Hf4JrOmp6EiDHRhjPplJHVlLkBaR/5p3Haht6OYvn+WzoWoxanOz4GiAN2iz5zd
 kUuHUsMSel8bE9V0vy9oG0g1XvaY4XHBi+nj7GJe4Qs+ttQ8TVfbdM3/dO5l6miGN5DM
 +kiC3QlPynX9bBDyTtRpPtyTQ93ykh7KTF5/c3gDKq72PTU6W7WJVxElfGAu3oknZble
 NcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790311; x=1791395111;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=a1o2Asq+Cn5ZDjJfxv1jHY9y7YTe4JwqPzOAx1j+Wys=;
 b=PZtd1BvPEBfaz2KcjzvOBKyvXq2ziHGyVJObVwgypkvpMJc8qdzMzsaEK5VI6YIDRJ
 ys5e8UBpANJ0OardYYvPyABTYU2KyrRYAB71do7qd4ba3K+TgEDSkUOkOgTFplQem/GW
 C2h2imUuTuyw7+BYa9alT4yXyPuQsWxx2VbcGCDgEfu7ZHiK1s9zBZxwyP+cuR1hX6vS
 dFZS/3tIf4dSEsuecNAdxRb7dlWFR1zuHdWn5aP1ZArXinwCNN8qNTYm/rIfdH8mXunc
 uT3Lye9HoH18JoWiMopCKGdceS1usUi7wxCt035VR5n/XBXqTETBYnHY9tAFC0EQqu0H
 9GGg==
X-Forwarded-Encrypted: i=1;
 AKwUvByfWTy+0/ZJtZTOJHBNSIo/9YfszY0SfSPmZscnmLgxNDUInjQ38y4R5r3tf1IR7bLPhH9pwVbfK/4E@nongnu.org
X-Gm-Message-State: AFuF++kVSzfxKjNcX5SHadi2b2FkexTzbFleTy1xl7p3knlhHULqNq3c
 C7Xg7FhFUulUq+03XNJ7+q5yE0ZKOi5dTMfJ+CP5XJq5uXN9E3OR0edqvp3pVJvbyANkqH0bt98
 8bx3lukpNaGBaeELimKAqUtg7uRlrBteRl+OHdNPN3TY4majxtic7mHVfkg==
X-Gm-Gg: AYBFou0cmDpNggrH2GGj8WM3XsQfE5W5soXVo10tXjTqMGEWwHD8NYjnSFexQkqyUi0
 cY1+xKksICfuDRUTaqJnu5VeBE8mYIERLgDoeutCRQtU6Zasm83CGM3+bybcoOgVVqzyHWm7efv
 EN1nWghXH613ZiNFEaC9xo3s9XtyDiAdOY6p0ZvolRkbVULVlPTCmwhkDLE4dZ+qlz2dJxbhfba
 dCMJEHDmuZsZEW9+IqO9Ew78lUSe0EHDbyNaWxrB4hv4a6aQHvQIGXpTv1yT1qvvky0M4nIZ8iJ
 yV4rVQ5y3PeHLsgIy1FfW3KpPmXID0j7gIaiQ8Odje7OUwoFxYKk9Tiy5xEYwatpvUo6FPSSSFH
 3QIzYrI9IKEisvYKvxj4W1K6WQFjLmpbuLKIqWS0i
X-Received: by 2002:a05:620a:4153:b0:93b:ca79:3b0b with SMTP id
 af79cd13be357-93ca97a1484mr387107885a.24.1790790311022; 
 Wed, 30 Sep 2026 10:45:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:93b:ca79:3b0b with SMTP id
 af79cd13be357-93ca97a1484mr387100185a.24.1790790310345; 
 Wed, 30 Sep 2026 10:45:10 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eba6e01sm6973105e9.9.2026.09.30.10.45.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:45:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 0/7] target/riscv: Make MIP accesses atomic and BQL-safe
Date: Wed, 30 Sep 2026 19:45:00 +0200
Message-ID: <20260930174508.81497-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX3lPpAUNAtd4t
 j9xXdUiR86CKFD+xx9GEOUIhf7dOhNbiO9wfMkOmljxlpqivdVfCyy2APTdeng7bytWyvNBG6cS
 +laNShQ+IDnJNCf64UxNHeFDhX4WZiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX8UdWN+qCFd2e
 KA2ilXS1SJP12iMj0Vll1wAG/Kcz6Awhf115dD0cbYQgTMspHBOHn0sjKhUwVOJGSWFddlG2DD3
 N8SJZRmFVhEwYukZHfxouGxbVkUCFBeux+afsuWGQF49MaPilwHeiZXLRnAWCj26lungJx/sePa
 6SQm2HEyE62AyniCQyaUeqVpJfTYa1T1hUmZHCmnEuMKEIoPg3MKzuPAiPeSHd2wKgRjvg8ocfi
 Wotu/ITiuWrrSOLnj9g9GpXSrUHjLVyUzBpa3AYg+jTs+cAvDSVPbU0ygbaeCYKd08L42rPu6wp
 jVqLMNyUzu0d+DH5ahRubY5aBcbsAN4a4II18Fu0WcY9cxhWTaGbaq9I2hvlcSPZohrnNDtqsUS
 L3kWoOdKqSSKk53fPUZNfO9aU7P6yB0PL9loDVMEw5f1milhEK7Sm1El9++OmSaqR45vCyaapEk
 kOsopHVcYywbI6HXeVA==
X-Proofpoint-ORIG-GUID: WXZqexax85xFco2fc9cx88tLMq7K5NRh
X-Proofpoint-GUID: WXZqexax85xFco2fc9cx88tLMq7K5NRh
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6abd4aa7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IeHq-CP6Cylpg2WGqdsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300070
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

RISCV-specific patches extracted from the bigger v3:
https://lore.kernel.org/qemu-devel/20260923171116.31276-1-philmd@oss.qualcomm.com/

- 1-3: document riscv_cpu_update_mip() and kvm_riscv_set_irq(), and
  make the differing TCG (MIP mask) and KVM (IRQ number) argument
  conventions of riscv_accel_set_irq() explicit
- 4: riscv_cpu_set_mode() calls riscv_cpu_interrupt() directly
- 5-6: add riscv_cpu_get_mip() and make it atomic
- 7: drop the zero-mask callers of riscv_cpu_update_mip() and assert
  a non-zero mask

Patch 7 was drafted with AI assistance which suggested checking zero
mask was a no-op as not reachable so I added the AI-used-for trailer.

Testing: CI pipeline

Philippe Mathieu-Daudé (7):
  target/riscv: Document riscv_cpu_update_mip()
  target/riscv: Document kvm_riscv_set_irq()
  target/riscv: Clarify riscv_accel_set_irq() arguments
  target/riscv: Have riscv_cpu_set_mode() call riscv_cpu_interrupt()
  target/riscv: Add riscv_cpu_get_mip()
  target/riscv: Access MIP atomically
  target/riscv: Skip redundant MIP updates

 target/riscv/cpu.h            | 21 +++++++++++++++++++++
 target/riscv/kvm/kvm_riscv.h  |  6 ++++++
 hw/intc/riscv_aclint.c        |  2 +-
 target/riscv/cpu.c            |  9 ++++++++-
 target/riscv/tcg/cpu_helper.c | 21 ++++++++++++++-------
 target/riscv/tcg/csr.c        |  6 ++++--
 target/riscv/time_helper.c    | 21 ++++++++++++++++++---
 7 files changed, 72 insertions(+), 14 deletions(-)

-- 
2.55.0


