Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E44CA6002
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:23:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEaz1-0007S0-SD; Wed, 07 Oct 2026 19:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEayz-0007OL-Lu
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:23:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEayx-0001JR-RA
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:23:33 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697LuZBi945436
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 23:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=iUj2H79bZ6zfQPI74wgeNG
 Wz4BdtVflx5SbXqdQdqtY=; b=KUhh/aEU8TYEHiE6K4LwkxAqbrSB7oe/ft+pmz
 IepZOshVOU3gD9UHRyHkFOUIZO1Xo8lXZ6TGwhMgBnZlk5qojDIT2h2WT1aaMs9/
 HR3DU9rJVcCuM19mMBxD1Q2IHq8WA0BKyYZzxAt27a+U5yrLgfrIlGvsGAQex2L6
 iUU9T8bcqqr7G5uC5E8Rwdqmgv+A3zkVOwIE0YEpEa0TZPDHiNnB+iWMPosHeOuh
 0rIWYDE0sYS5uCxkH7N8TnAoMPfiVX/pR1suxsUpjqaGydBYn74GVgSQ79JGlh3C
 EPj4houVcfHBTBZ4yB5UO8J2MHtUJHHkrGGb3KpNHJMLS1aQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rc7x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 23:23:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cc40759b2so949000085a.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415409; x=1792020209; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iUj2H79bZ6zfQPI74wgeNGWz4BdtVflx5SbXqdQdqtY=;
 b=V+C7KKSOxg1AY/oWsiMyH10p0s5MtXdgbYz8GCdIw08gXRMYyD2v721kciWirEdwbf
 rC9FLH828D5DYjCzN84Xw3KfmzkwAQSLQomEfD0zKLKECeceITs3VaXw1f7KqFzILKYE
 IpPBAdmQcNBWlQHST+WGS8n1gfbQJyYa39LI1rWJ4EaHoaWwdfhEPKqxL9RDM3A9vXSv
 SYfdUOWYwhWvcG2iYS0raJ2/5+avG0v7Z9qDeuUIKcOw1ZT671Al1STsYHPOGXM47GQy
 EiTz7f/G4JNu6PBK8RmACm6UId57hAej3zd8eQWJmA3KYVI/xF7UEPTV5oYmGZHCFfuq
 f/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415409; x=1792020209;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iUj2H79bZ6zfQPI74wgeNGWz4BdtVflx5SbXqdQdqtY=;
 b=b3SO0GLcaUn65l5bd2/ACiwZf1Lg9I5YjsATTZYggR7VJEwxowyliR940oEIlOUw1+
 cbJQ4S+lzOJZ7aDSiy9fcdAYRKYn+mzAHTSs2eyMlvH7KiGlIK2xWj1S6SdYWgxCa8/d
 J5NSbWoTkrDQhQLDZNYcVDYwmGm4yPU+1g1fnoi7huzcOulm/ZFPDWinnQRRHDcv928x
 kNztION8tXIOUbi58vO9I1Mnw2sxzOh/+zbpvL3FZI26FOU7hcTZSQgwllaalA+LVFXd
 StBrdpYlH3PPrjavZ/G4qwClXeElmExipBnWR1SS/Iiqt6cHGJkX9XrNk0sP+yJ8yZtT
 UaNw==
X-Forwarded-Encrypted: i=1;
 AKwUvByAGNqQdeT59wZZzBIfc0GD7BsTSvnw7fD4j/wF2o4UeuKUkRZYVBetMVyZ6k+O8Wu4oy26KY6QojJ1@nongnu.org
X-Gm-Message-State: AFuF++llEE2RQ7vuVBQIYbYoHuoJfvSvVnwCBB5S5SqUFcXo9qP6pYvR
 zKAz7KpAgnML4qsBVsUEed+Ys/GFfH+KLK12TRTKu6bmryQm527bcULQanXHf1wSixon34bc0OY
 k2xSvj6Ydi6s/V6mOqrKl/IFuBg3XTUG1Vz8Vx/uUR16QCYirlP19t4JOIg==
X-Gm-Gg: AYBFou3KcfH6jVFnKxWas2IMiF2dCTGMQRhPN6vbZTEn4l3YU6CYVrUZCIhMiiZJVhy
 7qQA64lnZHHAiXJI3lJ8je0F40fmFLXiWy0nOhdVaXau5AvbwQSfSoaD6jAMlSbUwjl6obZZQrU
 /1+bLs1KJR8K8/LBp3ypJ4uTij6nbK0Zx66hyHTJIkbfKL613lBl7CUV+5ln9d/pSoKtCzcyZtL
 fIlcm05mrngXwMozqKXMWbaJ3ezPCky6emVvs43jfU76U9/LuiyF5x/Rd4lJUSjd3V1ZyvrM6Iv
 qS38DOSbxBgXhgg2RbQma02umWbQR4ows4om13INCt+lODFxAN6AIXuMzyhwB5Sd2/aFh4m1kvx
 EGit5tEq3vD2JGwx8TgkWYjRQgvDMqIWM85qpBKRh
X-Received: by 2002:a05:620a:801b:b0:93e:94f2:adaa with SMTP id
 af79cd13be357-93e9b781880mr816043085a.32.1791415409109; 
 Wed, 07 Oct 2026 16:23:29 -0700 (PDT)
X-Received: by 2002:a05:620a:801b:b0:93e:94f2:adaa with SMTP id
 af79cd13be357-93e9b781880mr816037585a.32.1791415408593; 
 Wed, 07 Oct 2026 16:23:28 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1843bbe82sm21869735e9.13.2026.10.07.16.23.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 16:23:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH 00/10] gdbstub: Remove target_long_bits() from GDB register
 reads
Date: Thu,  8 Oct 2026 01:23:15 +0200
Message-ID: <20261007232326.66240-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac6d471 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8hlkq1QN6mvqOSdO4wQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nMp6z2NP3Vq58KGKyAtPrVmovxxxxJuN
X-Proofpoint-ORIG-GUID: nMp6z2NP3Vq58KGKyAtPrVmovxxxxJuN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX++ormvreA6Vg
 uhgRf9B4J3swNEyp90sgUyVMNeG1UY5QT1VmnGugJ40CdZbw8+cwedvrDFCIdQY4Z5QWtccFAeE
 QFoB8Ne+9VUvlzGa03VpSuUs7mgI53o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfXyfkTJzW4+h1Q
 Vctdtl8zehCWKUQYaETT5ri8Fz1H3fTt4syhOWTdD28Igd7SwkpITBeXfaMeMCiRC0QeVWoy8SK
 gGQkw8Jou9CrWitTiJjC75jls63eGswl9McKLNbqYSsjiu5W4iKoYk+Q1Olw2uEfToTPMnc4S+Q
 MLMyFKQgVBU3gvjyvAlMOdKYkGVPPStQ8czQIDvlw/N1clzl5YBjvsUmQS+7YH9+n9gzQlmXvhK
 D9Xq2b3uBJraWxGoLdrD5o3+vVkxDSAQGmp+0yI2WVWHVVWBoJvnrMPd8WoXyk43im92LwIlEfq
 kfDjmsTZ/4Av+w9z4paySt3nD68qsrD1fZUSFFjnj47gBOmI/eoHFXRicteD14ai54pX4XgY39K
 8ltF4vpYIoQYNZeSPPSPlIkA2jIwvzI/PNnA/t/XwdqvypFFMhzD0maRq1ukWxkXiiNWkADh+tl
 45UyNlzZ5GkAolMF/KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070093
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

Prefer getting target register word size at runtime (via
CPU state) instead of build time.

This allow to remove gdb_get_regl() and various target_long_bits()
calls, and to eliminate the TARGET_LONG_SIZE definition.

Philippe Mathieu-Daudé (10):
  target/sparc/gdbstub: Replace gdb_get_regl() by gdb_get_reg64()
  target/mips/gdbstub: Reduce to a single gdb_get_regl() call
  target/mips/gdbstub: Replace target_long_bits() by mips_env_is_64bit()
  target/ppc: Factor ppc_env_is_64bit() out
  target/ppc/gdbstub: Replace target_long_bits() by ppc_env_is_64bit()
  target/ppc/gdbstub: Replace gdb_get_regl() by ppc_env_is_64bit()
  target/riscv: Factor riscv_gdb_get_reg_mxl() out
  target/riscv: Replace gdb_get_regl() by riscv_gdb_get_reg_mxl()
  gdbstub: Remove unused gdb_get_regl()
  include: Remove TARGET_LONG_SIZE definition

 include/exec/target_long.h  |  8 ++--
 include/gdbstub/helpers.h   | 18 --------
 include/user/tswap-target.h |  2 +-
 target/mips/internal.h      |  5 +++
 target/ppc/internal.h       | 11 +++++
 target/mips/gdbstub.c       | 85 ++++++++++++++++++++++---------------
 target/ppc/cpu_init.c       |  2 +-
 target/ppc/gdbstub.c        | 38 +++++++++++------
 target/riscv/gdbstub.c      | 35 +++++++++------
 target/sparc/gdbstub.c      | 13 +++---
 10 files changed, 125 insertions(+), 92 deletions(-)

-- 
2.55.0


