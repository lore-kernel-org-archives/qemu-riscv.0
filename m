Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808E4CA5FA3
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHhN-00011V-It; Mon, 28 Sep 2026 16:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHgz-0000tm-9Y
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHgw-0008ED-Nt
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:17 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHwEgZ2348779
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wgDM3qEhbp+7QdX1Ng6R8eYj+a0jxFrcVLd
 g64hWt9c=; b=bhWi6ce4RSVt/4HmN0cjHsl+JD84Ee6DxqMFz4lHlR+KOqkJl8U
 vbR1H3RpSx//o90NQK8t+AuYzIlH2cgyFnbdKVZaNVOMOMQBOZE5KN7PeewqxnvX
 sVECfnAVieVKUIW4oVRuR+tvg3WffIL9CrAgON1ukQbOj3iNJWcV5zzUPyicghED
 UGpW8zI6PwTwQm1qiUt7R3L9Syj+B9VziFW1BO47Y0CU+IfTodJGtnIo3o2yTIQ1
 BwhIJ7M6CYfdfQH19QsgimtdDUHfwvE9LS1pKC0Im4P6hi9ITofGxCA8jQb7Cduk
 N/eg166+mkU4BTaWPvMA1yf/+DNxQgrksOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxkcjf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-53124d6a362so103640181cf.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 13:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790626272; x=1791231072; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wgDM3qEhbp+7QdX1Ng6R8eYj+a0jxFrcVLdg64hWt9c=;
 b=U6Cv83klH0yU1eClnEMjOxJqUKlIIMuFs4E5xQ0KaH7job6VrZE6OoMvPZM1gYdgc0
 VyuqcSAYNJN9MVCP75jbr1lNbxOMWqVtYm8MhaRUPK4jDCgLTtUFI2h9UJEBwRUMCIIy
 JH6vll3F0IQZrUPM5WYHeZw2N8QRsh/MhpehnyLtFpzMqgQixLDiewdpf19i9sI75TpL
 gfBrxd29ud0uSdQJgLO4KEcwBKc8pTHjgJVCCtytvFly89X8Sszyg8Ojck5CcQRCibeZ
 wz6kD0bCfA3J2AUOgXG32pVux67yM1W4Rv8ujUTgeGbDmz9Hq5W7qXU6ZjKc2B+J5VCq
 LImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790626272; x=1791231072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wgDM3qEhbp+7QdX1Ng6R8eYj+a0jxFrcVLdg64hWt9c=;
 b=Qqek9l2WbfTA8jmZKUdi81stSTvn2nE00XA3dpgjewaANHPDKd1Hk+WicGKXEqMIqS
 Oy2NpvO+2a3qjkkzQgPNu1Q79KWaeJGs7mzcWyCjRGxWiz4wJJoYdoRDrRFyWLmaHh4z
 Fc7ZE4C7XxU1gTjDMqQ0p4R368PmPshAe0fDL0z2pbgkRUXup+gNtORbZaEghWEogU8G
 P0KqhjhPHMRXvyImvtYN7rJfhB2LuXnOgBbhO5eYIVpa1uOaTniUIrAVDaEjs+YEv4z2
 /ImcuXGiVdqJhrBQM0uAtJBHLVJm0xO2k7zRjHxubpq888qlAXqUhU19RHLYYfFGaB92
 DPcg==
X-Gm-Message-State: AFuF++kb5Mt5JR+3vPMfTCtS4qItOYBNSmhcrCOhdFoPh802o3tPuMOu
 pIcuDQ8ErF6AFKELz7A2+kZ2eHJXKk6Lwk7AyZ+WaZ6tADEfP0WP7rnlLqOahKN/72NndmJXWd4
 YvVBeEUcoKe1iZHbkbzEwJ8v113qWJ6/Fs+xrclhZesn/jxO/sR7GXibkLw==
X-Gm-Gg: AYBFou1KnOGgvscr7zsszy+mjBwAqquPyldVjLMvw/NlbvOLSLCtXfiRVKM0HTMa9R+
 kXN/3EyzfVArrX+s9Jk8LM19bxJKh0x5w6/iZ/ZYsRkkX9gnBPQ80Q4l1Ec8PEdE3v1gRnG72F0
 TeH5GYaN0m/dPARWP0x5ZhEI9UdtdEBay9hxwt+larbTj+zGURaw4y7VSCucvWPRareOVVKUr3z
 5sXjlMhuunZT5lurehiLd4tenxILZEMK3YmWjIz5wiQN3UkFrza06wM5hqtOPtdKn+wYTdoSYpP
 qIOE4it/B7h4UQWEHsQ9TFy1TXi+iWZpKYFT1ZDNtVQRwlBELfP88VCljsemjj2Tobly7Qr35NZ
 xoZwBeqkxDYuY8lm+roLdQ88rF0qFgX900nk=
X-Received: by 2002:a05:622a:1341:b0:532:a96d:5957 with SMTP id
 d75a77b69052e-5330dd31e0emr232751321cf.51.1790626271997; 
 Mon, 28 Sep 2026 13:11:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1341:b0:532:a96d:5957 with SMTP id
 d75a77b69052e-5330dd31e0emr232750631cf.51.1790626271431; 
 Mon, 28 Sep 2026 13:11:11 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-914399d5002sm79815646d6.48.2026.09.28.13.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 13:11:10 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v13 0/5] hw/riscv: Server Platform Reference Board
Date: Mon, 28 Sep 2026 17:11:01 -0300
Message-ID: <20260928201107.2049458-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ahGH-qktpXQt8whYoSq612ZA1zOsDjME
X-Proofpoint-ORIG-GUID: ahGH-qktpXQt8whYoSq612ZA1zOsDjME
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfX5oUbjpSfXzBG
 8ftkdk3O3sRDqvyxFkwYvlb0koNCgaakvfY0S+s9hQBCbheG+PZO0snPLAs0F5oTMPCJ99RAJZD
 nGsDfE1eRReG40mQ80PiQkLYmmJKtcU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfXwtKA7RwF35dj
 QBeG0Sq+8L79xF5yikjatapZePyxAQtoeqdHF+zRzqm+hmkQgLEk1HEJxzYhhhwxhNE8ia4HWMS
 TLT7sXEDIM/+RT5tcR6GKkyYXtsQUhJW35Sq6cwzucpsZ1ZTk99S7GWFKFcirPdkLPNIjoAewQg
 8ADfhmShMHJwHIkzebsk+iYXwKhWcS8GTfCiB+TExEzRlyw9VicVnJMdl6G4hDvgEbJmKDgaGPh
 1SlkqznE9NpVpkO52BzhZYWOWskzqiwbRyMUXZbJjCzMkNzDm155fWprF0TLFpJ642Q/0bKa2W5
 eNmwG9TLaztxHedEbQlSLPJYFU57j8k/26ppfko5P1RSlE1dTLxflFrvAEvSrTEvRBKAJcWQsIn
 X/vFzWcGX794gzw9rflxcAvQSFxxFQBCCxJ3v357JZ9iXV2pPMxXFk1e6x2MrMOMRKKeRBx33KU
 fc85CKrhKmt2kqfUrMw==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6abac9e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5fshCkEan8EIRWPqq3kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280080
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

In this version we added a small addendun in the riscv-server-ref
command line to show how to instantiate a e1000e card with the board.

No other changes made. Patches based based on top of sdext-v10:

"[PATCH v10 0/7] riscv: add initial sdext support"

Changes from v13:
- patch 5:
  - added 'e1000e' command line example
- v12 link: https://lore.kernel.org/qemu-devel/20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com/



Daniel Henrique Barboza (5):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  target/riscv: add riscv-server-ref CPU
  hw/riscv: server platform reference machine
  tests/functional/riscv64: add riscv-server-ref tests
  docs: add riscv-server-ref.rst

 configs/devices/riscv64-softmmu/default.mak |   1 +
 docs/system/riscv/riscv-server-ref.rst      |  65 ++
 docs/system/target-riscv.rst                |   1 +
 hw/riscv/Kconfig                            |  17 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/server_platform_ref.c              | 776 ++++++++++++++++++++
 target/riscv/cpu-qom.h                      |   1 +
 target/riscv/cpu.c                          |  35 +-
 tests/functional/riscv64/meson.build        |   2 +
 tests/functional/riscv64/test_opensbi.py    |   4 +
 tests/functional/riscv64/test_server_ref.py |  90 +++
 11 files changed, 992 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst
 create mode 100644 hw/riscv/server_platform_ref.c
 create mode 100755 tests/functional/riscv64/test_server_ref.py

-- 
2.43.0


