Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51241C43602
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpN-0001WM-A3; Thu, 02 Jul 2026 09:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpM-0001Vi-7C
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:51:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpK-0007x3-Oz
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:51:39 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662DcfOa564799
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MwoyJ3+n9gbZYNrn4kY1BYNWBjSGHcQWXOQ8WJCYYjM=; b=alNS3D1q8CDpGcqe
 F2zQbnEJzAW11jKCpfiSun4EccF24PAM4Kty4TWOTzhLEZYRfWoQjhoC54jUXMTP
 Tkcvw6848Zs71A0bEVbF7rKDfxf+JsM6VpwLf/ufCHY0bqLkX5hegdJqwwNbI8S+
 p4Y5m07QjWCG87El0ipGLZ4ywqP+xyHJ/SVQa96VVahwZg02q0PkpYEJw9JzM9vw
 z3wxx3BrHmqetwlsZp7mjeM0KMkS0r599pbFzDkygiP9peusAvIezI/ndtp59Y5V
 FyYpk+7JPtYy5Yj6Ip460rBFrxT5AnZHf7UqrTm+BCDME2eVWXZzj6iSphpd9K1Z
 ry+Ymw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2501st-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:51:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7382fc429f6so1978890137.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000297; x=1783605097; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwoyJ3+n9gbZYNrn4kY1BYNWBjSGHcQWXOQ8WJCYYjM=;
 b=Xgd3qNmRv/u5C/CK4UE+oNgGYFM477LjeAY3UL+ntnV84NZBOmI8udh0v0K1tjknf1
 F5QIRtweFzqBOx70QfYyUS8KCYXgG+caraRprutQWzImO5J0BLGaiia44a2kPSffEdFL
 itAFo8Sh4PQN0qBwwN8x0zHUPH74xzw4oDAkSwxjuDZFqJnshEPW6/IC0svkbUgdMLud
 JppmhIl8mhTYcjhRkSwZI++sCL9bJ+gv3P0+rbuQwHgWU4Pnp2B5Qn1MR3Hh+OSWHLWi
 qr6t0pCKTnUpL3PRtBHP/+K6hndFrp8p+cP5JU6PRkpuIgLsXdLne0O8Slzg65YZTqt9
 nk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000297; x=1783605097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MwoyJ3+n9gbZYNrn4kY1BYNWBjSGHcQWXOQ8WJCYYjM=;
 b=SMa2AT/mCZFaTGxb9qv6KMCzVYTbaZLUFhjdC2Bb1fsUy8svGDg3lqUHkXjYInN5AL
 AJktAA6HfHkFNc2+6gQhJAj4IUuh+tu9pdU+yJ+AqPeKDmtFJkIjdLnPYqEg2HW0oY7x
 3rEz7TpX6gV4Rm6oHDLAW0XNxkxM8KjZhqku0HYiCRhqmGJPXm3JSBGw5b6HDVE/iKlf
 TYG11eFB9A22ypLu+kSP9jm4ZcoSo5jvRpHE+I0b0nBKzeTZ0wv0agyNAz3Qjzl+Vj8B
 WBELS3rxym6qa1cxLxcaTBtBLUuH7/4rwlbuTaMWP/Bbc6lXm+sKkXPbOBWItV7/sSQH
 OY3Q==
X-Gm-Message-State: AOJu0YykjsRK2dl6c5cL6pCd50jSK6SkYMCX78LY2HK6qj1e+HeEp7Mx
 sempwNQmuzW/dN9TbjK/3i0xDX2YldTHe+rNWC79kzl/4jUKNhlHOdCAcNG1PVu0Igk1iEJ4LSz
 bCWw26UOZCBvxaKiwGIUgEEH5plC6NhUxlh+IDVFC9KfN7aSjK1/UCUhLPg==
X-Gm-Gg: AfdE7clQaw5HS+/UGGoYaQRWuNddiXOFIedwrXRIJ4z5nlUPrpcf9SDHcDQ3xcsRo5w
 CWVsRpLgBRcvZVbpGNlkoLr+glgO0X4ZL6IxDzVKRYCCH8d9UMW2cqBGbV2y8mP1pK8MovSUr+L
 5zAoypAejK20c+24KDDPdbUZeyPFiob8btZINDvRx4fN/9Hm/cQQFc1JImwTfLGxXAZDRodKWxT
 vYWenDRh37n2HKh4zAZFR2FhMfMXVrOaIz4QfiEpg9gm3BmUDp/Apg1PImDLIvuxNnd1Yn5kF9R
 1o2o9vNPOpby4N7UdzuDN1bDslHOIxXTXhHC+6wS0qzdJeaZLF7olZkqMxxBksSusY3GITvfooL
 cBklCs9OuM9jWzix/vPmekKSIVO8xkVRdPj9XNfUdauJbvw==
X-Received: by 2002:a05:6102:2925:b0:738:54e8:c101 with SMTP id
 ada2fe7eead31-73da95b0c2cmr2818512137.15.1783000297158; 
 Thu, 02 Jul 2026 06:51:37 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:738:54e8:c101 with SMTP id
 ada2fe7eead31-73da95b0c2cmr2818490137.15.1783000296628; 
 Thu, 02 Jul 2026 06:51:36 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:51:35 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Zephyr Li <fritchleybohrer@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 01/24] target/riscv: Remove unused tcg/tcg.h include
Date: Thu,  2 Jul 2026 10:51:03 -0300
Message-ID: <20260702135128.1188021-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a466ce9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=beEPI9FAKrdLFu6WGxcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: m13bYRn5I2D4qyd4jI0z9ThNR_-uZ9QO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX52zZjfhCgQDK
 qSt3Ti2BDBpbO/gO/87RXDUJ4FpoLCNSbh5BNxegc3KQvO5mbn8vQqECzHwZfAYokiFcOAgG31J
 /7XtSZZe+0pYV5+/J/B9UldRbe1tSzpjEnFK12/75oCVm6tZEaMaEseQRwdmCCwTHspLRnbBUha
 xmb2L90e6F20deZTI1UTIaUfVe6Gh0/ZHaINLC6V5JbXUtRsoVqxTXwYF56aG7sWDWxKnON/dRl
 Ikk5ZLOUc4mJ+HGH1aV39/58JEyN78L2M3Oc82COcVuv1Rz0cuDn4TvMayNy6NhhxC07T3rk8fG
 nh3mEDh+KLkQDMMyaaykZ0UfYAejgsjPwUFI+4slKah31cIZI9hIFOlqE9uL2VzHuRNhkFLOB2A
 5akibjpeX/31jVLh+wsUtquhvHTnyMRlqcZir8dy7iHn5LcU9DRn2qEop8L1aIIA5Xe2qPRBMAE
 A8lxeTREKHNunqsozAg==
X-Proofpoint-GUID: m13bYRn5I2D4qyd4jI0z9ThNR_-uZ9QO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX1eh6P8ZisyX9
 kPGO0gSk3fDCFbVlY067/hQV6jKm5BuKbe0gX7/73hZVQj7lZ4YVYZhSzL1TCc3P6rpnxIdbTwh
 6yd6KdsjUPeT1no0uo4fMQlIGKCjQbM=
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

From: Zephyr Li <fritchleybohrer@gmail.com>

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4d2eb281bf..7664e686fa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -38,7 +38,6 @@
 #include "system/tcg.h"
 #include "kvm/kvm_riscv.h"
 #include "tcg/tcg-cpu.h"
-#include "tcg/tcg.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "target/riscv/debug.h"
 #endif
-- 
2.43.0


