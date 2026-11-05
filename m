Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5CB606A328
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YMg7iCK2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gj7ks2E0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOwxA-0002l1-Ry; Thu, 05 Nov 2026 07:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwwx-0002kE-Qa
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:52:17 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwwu-0005fJ-Er
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:52:14 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tJDm3684598
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=C4wyhq0QCfy+i3u8v5T5DX
 pWAtc9llSmeEyL5gk7RJs=; b=YMg7iCK2dQuIT4T18+Am8zHmo/7wVPG7DVPGUe
 x7/Ik9xQWwwY47tVZAjvh3PRqvztI6dBi8d55i+TMcSm6qwbNlCe7gkU6RYfimT7
 9k93ueSwgcBsX7bbxRC/UcF2cwfJFX6o79ToTwEig3YIJK4MQ8GhThdDt92KLQMq
 +9lOMdcWp62JMZiU1yzCw9op1RqdMNVnWaU0bf2kg5WYcUFvA05vidnkKE8uuuhY
 n/EqynFP/jIvmJSEVulpfWpLPZKTOT9mHackjO3YgRpmcrEeAq+KR3CaSPNNB1Ha
 wsPCretCErsbKkJGlqU/yO7/SXZ4dPJW1v32wH1WPkowZ1aQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43j4nt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:52:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93ce7a85f04so415667585a.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883129; x=1794487929; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=C4wyhq0QCfy+i3u8v5T5DXpWAtc9llSmeEyL5gk7RJs=;
 b=Gj7ks2E0Xu0ISXIzkk7X54evZD2glXfSWM0Dva7qf7+E3Yn1jW6NDTiFu9ItCYhWDj
 65H0wZhEAV5HrVxFLhxuk1Dy7uSvcYx+yg7/Oe/NHq3+WEF/xM/qooo6JfRvzgUB3juw
 3dx2kYKV//E4cpqXUMUVRVXLmB1VcNgdW4hw/iY4wGzCwI+OmzrTIUvX/HsfrDPNJWXD
 AOq+Tk0GVLZsN8pxyYpUAat+Ti36QCtXt0HP48lw4xVRAs7FbLAEZawjJw3nJwbtXYzr
 oBJvm+DMWeFG1DGa/GsNlBWW2XoMMqxLR4LybR7LdIdBw34jFvclHU+mg25XlrWYgcUJ
 RrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883129; x=1794487929;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=C4wyhq0QCfy+i3u8v5T5DXpWAtc9llSmeEyL5gk7RJs=;
 b=R7sbGbEBoGS/VdV1pq3i84sVE2nLVr2ZAFp58PJIkn0HZCVg37gGVAe50mtIq3NNlJ
 o2w4f9Ygn2lzXVXMWj7uxehyU+Bmu6Wf6iqkZ7x7PESAcd7Hpwy/0AUZ83yQaP4iaKjL
 4MP26L4ZaQW70NJgpNwopUpuZ5yukZu9ucn6kgBRwNsSQFWBTIYxfefmUvZ5tgGY+MsA
 VorDQyb/QmTluJGdPosfoCiahqubiqlVozwbY4WC79OlX2v8KV6HdQt7/Qmm5hpwomXR
 aqL3UQA+5405FCvVThNhMza2rYG0wFxuHmwnr3b+PIFADnoJClry5UiJ7/M54Z6Flyg5
 QdXg==
X-Gm-Message-State: APuU4Z9SItShjs/hzN4NVtLixpaFxIQXzSARih5zVoQVplJkyFPVZzCk
 RAzORArssLa/fHpT6xSNmA54QBxUwq6tE/m0vP1gP6ZA3rmtOf8Jo3FQQwkDvxJEjxl7k4+MUVC
 ajVgP3j96GpAU8vVlyPxekzcw1Np7q8khlhOQOcJnVa7hRr+9yFFxIG8e0A==
X-Gm-Gg: AYBFou3fvAo/LvmckcqSbk2KCsdRSuHOdcExyqeItzss6gCBAP2o57qSMrHoF7pcmnV
 zzF/VK0ZbmuBLu/Sq2ssZJOodrTYlhhr/d2V2/7q/S9cvSBctewez7LxnnBRkpn8/UlREsiYaqp
 cB3uzC93Kn3v8CmZQw5wtmgJX1PHdeVBUIthTsWdFmYQXmT0babNBP2bjgTuvitOSiIHnoMHFau
 82s0ij0WqYygzxXZ60agbgbMY92ps48g1NdmV5KlCo/XJqKJIDBP8eAcoTm6P9KxIeRwXQKSBah
 oOSXJqRI/2KhB5Dg117V2NkF6rzlcc8/U5sF9e495dm8fzs6Nl2VdHwueL+0ggPWim0MGzvJ8Aa
 0pk9MYQvYnnxiOSXfFWasSxTXxbhedSYlO2HVPmH0mkk+CWwRA2TOS4zMNPeroEB4UHxH76hrPk
 XRUZ88pI4bed/4CUYxF/8Dc4McEB8rFA==
X-Received: by 2002:a05:620a:2614:b0:93e:920c:bfcd with SMTP id
 af79cd13be357-944217b0ae7mr3278776485a.57.1793883128870; 
 Thu, 05 Nov 2026 04:52:08 -0800 (PST)
X-Received: by 2002:a05:620a:2614:b0:93e:920c:bfcd with SMTP id
 af79cd13be357-944217b0ae7mr3278772785a.57.1793883128276; 
 Thu, 05 Nov 2026 04:52:08 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55ac57b9csm1738357a12.15.2026.11.05.04.52.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:52:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 00/17] buildsys: Replace some deprecated sprintf()
Date: Thu,  5 Nov 2026 13:51:45 +0100
Message-ID: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4cxArrh8raOzktys1qYEAWtY1R7Xai_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX6r8YHC20qj73
 Ui+Fwa1PKsUKyroMkVC5LSSJtgfc3fuipNg3p5HQ0yEQ0sOINn+jhmgtMOZ8BKGkFOLl8cw7uzV
 P8F8TOmCG/HGbat2qamM+KyW4lua+QAs9edajFUdspbaZlgWgMFOslWrAxyW7zcHfT80rh6y/tb
 OsEuSzYB/7O6hL7KacIk1c63NGGB4LcXYXppR1khViKMC8NgS5nYO+3JmIVuS5Scsm7gAy+IApS
 o6xsdCmgf8eSiC4U00B3hkSTPhYrI/8+qnSue+yHAq2+T7d9aGpqBZXv8lUU5dZuzhgVb2p3Mxo
 yMCcsPjW3ZWiKtVsNoN8Bdnmx/oIooXWVQdDgVHEjOmV94BwC6KB25hxTrBH68CUxQiz6BP0S+v
 2cbliAQKf4PXM/uxFC9TrbiOpF/orc0uabbyFx/GI0eEQeUNbIcGMIEm5UToVUHxSTuHynqJZT2
 6fqSmwrEQ/Z+R4yBJNQ==
X-Proofpoint-GUID: 4cxArrh8raOzktys1qYEAWtY1R7Xai_g
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec7bfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ym21472aoLdQ4Bz9H1MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX9Pevdd4nn6AO
 19j00plAaTT1QphSQcRXj/JEcYblw8LP3v9y8O6gAv7D6aI6efc7LUen0HhZKYMWb9xdew5Vs0N
 S8ZTsPfb1wTYiAYaHPk6bEpLGaNqAi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v2:
- Use g_strdup_printf (pm215)
- More replacements

Since some time now we get the build output cluttered with
many deprecation warnings, it is becoming hard to notice the
real ones. This series fixes few recurrent use by the
--disable-tcg --enable-hvf build.

(Yes, VOF is not used on HVF x86/ARM64, I haven't
 investigated why it is selected and built).

Philippe Mathieu-Daudé (17):
  tests/qtest: Use qemu_hexdump_to_buffer() in qtest_memwrite()
  tests/qtest/npcm7xx: Replace deprecated sprintf() with
    g_strdup_printf()
  tests/unit/qobject: Replace deprecated sprintf() with
    g_strdup_printf()
  tests/unit/visitor: Replace deprecated sprintf() with snprintf()
  hw/ppc/vof: Replace deprecated sprintf() with snprintf()
  hw/usb/hcd-ohci: Replace deprecated sprintf() with snprintf()
  hw/riscv/platform-ref: Replace deprecated sprintf with g_strdup_printf
  hw/vfio/pci: Replace deprecated sprintf() with g_strdup_printf()
  hw/ppc/spapr: Replace deprecated sprintf() with g_strdup_printf()
  hw/net/eepro100: Replace deprecated sprintf() with snprintf()
  hw/net/rocker: Replace deprecated sprintf() with snprintf()
  hw/scsi: Replace deprecated sprintf() with snprintf()
  target/xtensa: Replace deprecated sprintf() with snprintf()
  target/m68k: Replace deprecated sprintf() with snprintf()
  target/rx: Replace deprecated sprintf() with snprintf()
  libdecnumber: Replace deprecated sprintf() with snprintf()
  qga/vss-win32: Replace deprecated sprintf() by StrCatBuffA()

 hw/net/eepro100.c                        |  2 +-
 hw/net/rocker/rocker.c                   | 24 ++++++------
 hw/ppc/spapr.c                           |  3 +-
 hw/ppc/vof.c                             |  2 +-
 hw/riscv/server_platform_ref.c           | 11 +++---
 hw/scsi/scsi-generic.c                   |  2 +-
 hw/usb/hcd-ohci.c                        |  2 +-
 hw/vfio/pci.c                            |  7 ++--
 libdecnumber/dpd/decimal128.c            |  4 +-
 libdecnumber/dpd/decimal32.c             |  4 +-
 libdecnumber/dpd/decimal64.c             |  4 +-
 target/m68k/translate.c                  |  6 +--
 target/rx/disas.c                        |  2 +-
 target/xtensa/xtensa-isa.c               | 50 +++++++++++++++---------
 tests/qtest/libqtest.c                   |  6 +--
 tests/qtest/npcm7xx_adc-test.c           |  8 ++--
 tests/qtest/npcm7xx_pwm-test.c           | 14 ++-----
 tests/unit/test-qobject-input-visitor.c  |  4 +-
 tests/unit/test-qobject-output-visitor.c |  3 +-
 tests/unit/test-visitor-serialization.c  | 21 ++++++----
 qga/vss-win32/install.cpp                | 17 +++++---
 21 files changed, 102 insertions(+), 94 deletions(-)

-- 
2.55.0


