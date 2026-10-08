Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9E5CA6002
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 00:15:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEbnB-0002I2-UT; Wed, 07 Oct 2026 20:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEbnA-0002Gl-97
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 20:15:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEbn8-0006Xf-8P
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 20:15:23 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697LtUSE4151752
 for <qemu-riscv@nongnu.org>; Thu, 8 Oct 2026 00:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QOyZfAQEWSqVJm0Qisn3v4+NwouWsS+/q8nqtl7+UTU=; b=ZLeSbPXahFFGDiKE
 UZrCAJ0cfcLZBC0cyrDrWRmGi3EAZA9bjHIXme2Y3XI+cZs++4225Wkj03ThtOH8
 gHUSxiqKNT+sox9a7+W2HvdlY0ySrWiC3ItWOeu/NonRY6Y+bCMAyVEeNqIXyMu/
 MfHQhAzD04uF9ZpzFeB+1yLRjEj+ThhzcOT15OGTCHrzhrH5pBjFj7MYSAWjWE52
 sf8LD/PSfsEOkyee3inEr+khaEXKmF6Ry+rUic1Z7e/NYA+0frdInbNrRZb+gWv2
 uZHn34bQydp9OJYhv/FXvdSfQNPKQCn4lZl+c/ppZx33++AJrW43Je4UJuh2wgrU
 JX6nrw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38b1t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 08 Oct 2026 00:15:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-341eff9e381so7426354eec.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 17:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791418519; x=1792023319; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QOyZfAQEWSqVJm0Qisn3v4+NwouWsS+/q8nqtl7+UTU=;
 b=BvTn6R9JzeALya1vC6xNORAQnIacuMRGxhe1gdEF0a8naRIhVd437dh56XM4i1TkB8
 AMDjkucEoJAEHGFK5Z5ImE5J/y5NGcft50nTeQUHbaXS5uLQh0WXP61t1JdBCSLWCnNJ
 R7vXpA39XGoiAyrf26x/KkRj+44IXCnM4HApY3DZPvbzlFx4wJxsGhV4m+D/h7s3QCLr
 lFUNDgovZ/658EZAFIcTdVOTVuIY7FOE3Cm/q2OG5K/poBar3PPDeglXpSVvWHoYt5Kr
 Sopacd080F4GDz17JkaZQjQ/7UlgT8Q15WECWXJAOe4qvvmUtwf8zj1xJZR7hozqa/Zm
 /xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791418519; x=1792023319;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QOyZfAQEWSqVJm0Qisn3v4+NwouWsS+/q8nqtl7+UTU=;
 b=Gg3LS7KZBr5zZe6vT6UWACr6o1bqbAdEJ250DOECDZhzfa8mFv7YWaOIyuICFAawpK
 U3NnMiD/cIFX5Z7ZxuCRKndgQpZNh0vX83wLG4au7yC9Y99L5siQq9PDMW6miLsfPdTe
 YWjw69ZuN/YgE/P8yzmplOCsTMw7wjOlCxf+97bN2rtE+LnzBeFB2CRVFbv8AIQkVHnY
 pcqgI2kSr2YHx+2V4ghQw8yFxH6KPWexwGhkPtcWzYH5Z3a8Zv0qjkyxtShnpWK3L3fi
 tWnBEfIOec7qZ0YcbwQw89k0H2vsP48AKR2IJE6qudyLs3+iW8V7hJDW/fqig9t/O12X
 gnIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz8Gddo+HRYFk3rJ645iQPb/DRDaymN2ZqMtqFV71jhBkxii0SsflF/FSkqBEdbiomJR4rMDl1G46EG@nongnu.org
X-Gm-Message-State: AFuF++nBAo8uW6tscXddfFyGprUawBWcv3XxtLpQZe6WWxUQ8qgFROqp
 2mF+QOO+5scirzA3Pszwp+O2hewu/nazOJNg2o5jIgmY2W6HCsEPU5qm5wiLoClf2wPoCf7CYVk
 b5FcNyh3a3W/XoubjMvQTlSQJdQ+L+yTzPdvluf70SxJ7yEnoThkynHt3ig==
X-Gm-Gg: AYBFou1yZSoVA82LAeGQa5PfuskrmYiQfYQjIuQc/C1sY6dw3vi76hER3OVGhcQ6eMA
 GaTRnrNxMJYi71SfFI2XbCwMR5a0xN3eo+COIFcqSCa66lEAEvvNwNuO62vmaJpgGQdbUII1isR
 oWlmM9bUtXBhskDiu5xW9BdzlQZH+Fvo2JpUYZhpPPEeevF7v3Rg3FqrVGz3vAFzG/OS9n9n1WW
 ksNlCvXtHSuwOpDRw6q9HC42ZQQgsDOCmAeJxT0YYmiVr6eBAZDR18EiNyyvp5lGTVpYqJXO6IT
 nnV8+MGznBJE4Bo9cuK310alQIe9ylGLEWewCTvIYR7EwxFESnQmmNWe5NDjOvD0YDIMle2TUN+
 zoK212noK8iR93l7QPoijgXh9fmI5VWlQ9qGXXNJ2THgoDXFYyOUhyDnH4kTbZQTKH/9Jkw==
X-Received: by 2002:a05:701b:260d:b0:14a:8df8:56b1 with SMTP id
 a92af1059eb24-1662477142fmr399332c88.22.1791418519423; 
 Wed, 07 Oct 2026 17:15:19 -0700 (PDT)
X-Received: by 2002:a05:701b:260d:b0:14a:8df8:56b1 with SMTP id
 a92af1059eb24-1662477142fmr399292c88.22.1791418518555; 
 Wed, 07 Oct 2026 17:15:18 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1615f1ac8c5sm16510220c88.2.2026.10.07.17.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 17:15:17 -0700 (PDT)
Message-ID: <da50c29d-6ab7-4763-9136-3b6a575d0c95@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:15:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: Remove target_long_bits() from GDB
 register reads
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007232326.66240-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 18Ebv2_3coT9YE3Tg0j1g2FzwxSWMaVO
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac6e098 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=k4nKmolST_FcVLJzIUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX9reRprE8UZPG
 t0BV9NbTv7W5wH6dBaot+ett13UnV7+/CC3sg/2LC2TnohE15sVp8Zu0rt/DOTvO6QVT9v7WrJ1
 k1ES01IAmaC+PRV9tEEKrqrlNMK95q8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX7ULlfER3dNIe
 Lr8dLsQxyy2+pflx2roOHKg1iQCadnyr8y1xfTCAd3jOigd26rAm0EZuHpex7txIUNhk+m6mDkF
 B6dKlAX7t7MKCOuj4FnSACYYjAdcC4oBl7P4vNfy18d9JWYtshV+K25wqZ4w+xODxczk6H3ioLF
 rB4K9+Q8J0ggZ3e7oWsOe3qA3IdzpWxrDsQOgzql0XUfhXDg4KDkuBAZn5T1XMiJdz2JGwBIgVr
 ZqkFZjr76jmhmCMw61SnwopJLXTJ9+lPzIgI/1X+0tsy0zlNrVkJyJkxpYY09LTkjmKQW6KA43G
 ch3GtqlNEM/KDrFNuYZMRvW+cutsd0VsfjJpeIVhKN93TsasajzGhVBlm2hTB9Rf/2oXgMBB2Jh
 BJVgjXj7c87iJ5I6dMpvhPFgsSgcjH7JCB14Qirt5o6V1UWe466IFi7ijbOveHDOGLSwJyPCgPe
 N/3XNXXnCx3Z5he7k/Q==
X-Proofpoint-ORIG-GUID: 18Ebv2_3coT9YE3Tg0j1g2FzwxSWMaVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080000
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/7/2026 4:23 PM, Philippe Mathieu-Daudé wrote:
> Prefer getting target register word size at runtime (via
> CPU state) instead of build time.
> 
> This allow to remove gdb_get_regl() and various target_long_bits()
> calls, and to eliminate the TARGET_LONG_SIZE definition.
> 
> Philippe Mathieu-Daudé (10):
>   target/sparc/gdbstub: Replace gdb_get_regl() by gdb_get_reg64()
>   target/mips/gdbstub: Reduce to a single gdb_get_regl() call
>   target/mips/gdbstub: Replace target_long_bits() by mips_env_is_64bit()
>   target/ppc: Factor ppc_env_is_64bit() out
>   target/ppc/gdbstub: Replace target_long_bits() by ppc_env_is_64bit()
>   target/ppc/gdbstub: Replace gdb_get_regl() by ppc_env_is_64bit()
>   target/riscv: Factor riscv_gdb_get_reg_mxl() out
>   target/riscv: Replace gdb_get_regl() by riscv_gdb_get_reg_mxl()
>   gdbstub: Remove unused gdb_get_regl()
>   include: Remove TARGET_LONG_SIZE definition
> 
>  include/exec/target_long.h  |  8 ++--
>  include/gdbstub/helpers.h   | 18 --------
>  include/user/tswap-target.h |  2 +-
>  target/mips/internal.h      |  5 +++
>  target/ppc/internal.h       | 11 +++++
>  target/mips/gdbstub.c       | 85 ++++++++++++++++++++++---------------
>  target/ppc/cpu_init.c       |  2 +-
>  target/ppc/gdbstub.c        | 38 +++++++++++------
>  target/riscv/gdbstub.c      | 35 +++++++++------
>  target/sparc/gdbstub.c      | 13 +++---
>  10 files changed, 125 insertions(+), 92 deletions(-)
> 

For the series:
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

