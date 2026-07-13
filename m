Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC46C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjFVS-0000tp-Ei; Mon, 13 Jul 2026 08:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjFVQ-0000qY-AX
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 08:11:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjFVO-0006eb-W4
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 08:11:28 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D77QMb810532
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 12:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GF1nzRiJdqWJEt6VpXrCC9Dp7BJLUS11lP9x00Lf9es=; b=JRrKhPpb9X4N9Ll9
 0cpLZfiCWIHZZhURaxWRVC4U/iNq96Q5O/Bvy91UNhqs5TH8WdEXA03kTQqlq7DA
 ogIGast/ACPhvEZe0SjhL05UewOziNks8j6J3HKCcylbxkUnVlMX7ucg4Wij9Fo1
 mRyofhnpJ5Awq0y9W7qQkmJUgQZxG7QnCWsfj4yLVTWo8zuFir39nqJSQ5rppa8i
 O8Qgy+0bTe/E4/iInTAlbD9BDsUkhfx+Eiy/E+01HeqYIf5Y9MrlaQdBhd5Ni4SW
 tuRB3Nzg8Crv28ufa+tog/PbTBPE1Ge2n7pzMgPjewTs7B2jMReoAXTl1TI7G/V9
 ticFQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubss3hf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 12:11:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5174a236220so46246941cf.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783944685; x=1784549485; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GF1nzRiJdqWJEt6VpXrCC9Dp7BJLUS11lP9x00Lf9es=;
 b=krXoG/K1EBbIQ8KqlN+Mt4ysNJehJpD2ghSC9ma/EBftiRwqlQtNW3/OWPJ6Lo949f
 agEebloMm+AXrLxYuDVj9Bck7CiWw9F7GoyacknqWIfUGClU0JVYqUzIGI7wMimZDcw+
 m60YxwTRG3gJj/rsRoVCftYgAs+4ZbA2qJqDuZwkqNvmZxpc9vtJVYuktPCC2rw2VBQe
 YJ/SMelPmjebcjFHTc+OVhJhPnPWa6z7RqHhELecUPqftDQMVAS03ulhInZq1/Rk9wcO
 EqG1MR4gBDIb2ExWJYyeL3gmKHNqN+j/uJkWj1Q/TCh8mzl16Wo0Qzh96lLGuQ9klyTK
 mqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783944685; x=1784549485;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GF1nzRiJdqWJEt6VpXrCC9Dp7BJLUS11lP9x00Lf9es=;
 b=Kw6QSnam72EmF2EeDFDmfLhURQaT0l2Ar9gzj3m+d6Cr7PLKF6/UqDTIntm8bF62zT
 OiaVV4tihB2d13i7Mq92oPdKOWg8s24JfwvtmxeRt+iJdzZ+ZOwnhU+T4jk3xgIfOElJ
 j3BCXW617etBFEUtXG6/zwJbyqT8K+8YlJPzWgwEeyK2AtbGK69BUqSRBjjdj77x/Xn0
 yTqcRkTq3YuF9L1s1N+OxwpMQ7e6tfek0gr2+Kd2BnMomqV4GIALb+Wdm9XEyKrItE4+
 AcvdGUEto+wgTovx5PzTYK4PgWf5SK5j5bG4p+DVUC9lKyHAuPQ5EQ/kryDedRjDs4sL
 yZ9w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqjYYouE23kKbsM8yfQ1L8J/oIrZ+h4oWSH9PDinuE9cfY/fXd9Ii3wZmRV/yk2kDyLx26JuveOnEbr@nongnu.org
X-Gm-Message-State: AOJu0Yzy+WZtiw6v1RxCQYQxqW5IFABM9kvlBYptpss6H/g5hrHvgEUa
 C1uHPnsmXX4RIi82Vgu8Fj4ZuNrGCA90/vMFVGe6aNWQvoPMxwnEhB3Zc/o3wgOaTRR+Yd+tigK
 cfH0icloHA2+2yQq4hSDiOwsASbJMEIiJARY5o4z1bja2gwNEisI0Db/jfA==
X-Gm-Gg: AfdE7ckPAqQmxchGt0Mc90uA7+6iT+p6eWOPWRLmINsAKAxn/vDy3tSdsaIAp/TtZ37
 8JojZMtUoOWjADUvOgjsEo8yjubP1Re0iGkTgcuokyf01BKDfr7mM+nC0mmp0yUWtSiHDuq+Zq6
 yobgPxBIMGweW9G73u2XHySo2tvmSVaqwcOQLfvUJw8wXwnl3OL4AFhppOo2453zD9xkkoTgv2z
 3bv+X6UuXPExNLUAV6k6Hnj7mJi7umYo7Td2SP6PQHPatAy4MsTpiTYhnBDq20RBdJXPHHJ6Up6
 P12nYPof4AQ5Z9QUsoGV5j3Yd8x2H9Sf7STm4qQTU4fmBl+ejtBh5qX+/Br5G7L+7GZz2fnh7tm
 dB/p55GCjU5LEdXraejYOWsbmAQS6NXLPo232ADKSfdkKJLc5ngGo6RaSrLILzg==
X-Received: by 2002:a05:622a:5a05:b0:51c:e14:87a7 with SMTP id
 d75a77b69052e-51cbf1628d3mr88398741cf.28.1783944685352; 
 Mon, 13 Jul 2026 05:11:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5a05:b0:51c:e14:87a7 with SMTP id
 d75a77b69052e-51cbf1628d3mr88398531cf.28.1783944684932; 
 Mon, 13 Jul 2026 05:11:24 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm581267955e9.2.2026.07.13.05.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 05:11:24 -0700 (PDT)
Message-ID: <cff0ca65-ced2-4304-83dd-c2786a2297e0@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/riscv64: sifive_u: Fix kernel command
 line
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Chao Liu <chao.liu@processmission.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org
References: <20260713120245.781959-1-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260713120245.781959-1-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54d5ed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: luB_cf6MwvuOrm2IZ59mZ8tPwU5T0v1n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX6tE9FztAtp+Z
 cjKs8IZkBZ0X2rWWJj7dH5ldtx2FUE3U2Xe2zmf4mZQT+sotWDnXi5T4Xf1JyY7koUUi/99bjyA
 qnn865KyycY5EIUXIRsKKRWymhMDT60=
X-Proofpoint-GUID: luB_cf6MwvuOrm2IZ59mZ8tPwU5T0v1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfXzdU+Ag634r1M
 nG8REBrGFTUpPQt8FoXNsjBVR8T2Ut9oLl66iJ4ej+gmOMqHvJHL5VCi2Teu1joWQgPm8L8klWH
 QGdqtUb8fr+dlC8ATPr3gIKEqjEWrFqUxZSq/VCt6NDsjX5ylzxBgNpOn4RUOsCjOSOgy9jbrx+
 1ARQx/HQAae/H8tm1QgiHlsxehE2sEOg9DYo7iD0bQlhJiRwx3rDWLsugKr5HReGqXxoqghiyYu
 IJ/LITEzs5a1LPCT0o0Ipg4i3qdsHNk8eALa5fI+a7tHhpag/hv7ZAEAJOSGm64Kll+jDi++i1D
 VcdDsjiv27881bbN5PYvtIf1DPvWAminVBId/SMrqO1UkExN4+iAqVgqkOSNGXa6d1kpGpYz0uz
 +avm/YUJHRGvrVXUU32VEpcwHzfzDgWaHCQ1D+F435eePpzbiB0sCmBw366Q4oIlNssn4nY0l+R
 0L/lSD8H4VW50bzaj5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130127
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 13/7/26 14:02, Bin Meng wrote:
> Build the complete kernel command line before adding it to the QEMU
> arguments. This ensures the panic, noreboot and rootwait options are
> passed to the guest.
> 
> Fixes: 7db162fa0138 ("tests/functional: Test SPI-SD adapter without SD card connected")
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> 
> ---
> 
>   tests/functional/riscv64/test_sifive_u.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

