Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2639ACD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:31:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT1yH-00007Q-F2; Fri, 29 May 2026 14:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1yF-00005m-Cf
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:30:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1yB-00079K-17
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:30:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2HwV518375
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BASaeUV+sd6PCcE49dvGbjsSrGUAqcny0XRVjurx+GA=; b=UCL2LGLzVgojOtD1
 4RJUt1PKZtHOAIy8pTJllBQuCamUyxVpO+cy5eqqd/vWp/TNs26mnyQj7OZ4Tadg
 yC0G1ypIeDwsm/MNshuE45dX4uJMzLLcKsNUaPYyAPJdMGMaqgYVUc5+ayCRFCr2
 HxUJSFUcZb3tMuLVR/9uQ+uBapOUupHnKkWDqI/ye5wjrSk6ZceuilgZoxeM1Xk3
 +2Lehj9diRrPe8F9ljJ56P9urb1pHbLiQD9EftRUAopZ4wubmxVpu/2z0ru2JZHz
 2OtyhgXG0pGjaU2YyQbCtJgcbC0FvFgkkcIPZndDyFBMU6kNqS5L9oxD4mzj8N3Q
 7yfesw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgt4d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:30:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304ea1eea05so2845232eec.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079404; x=1780684204; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BASaeUV+sd6PCcE49dvGbjsSrGUAqcny0XRVjurx+GA=;
 b=V9eq2DtTPYZWspWeXpjNz5cWkW1vQB6z5vmqBTT9t4VNZ4U/sa+hieFhGSQEkhq6nZ
 TDJVcaiufScISv2D3A6uOwZfsj+1uMNcGCvTyGRUrjHYFlFQyPm7dUnXWnBXsBHkX2Su
 41luZag5FoVYXHd2Rl/KPyNKY5N15bMLd+MExr/Gae5V3/c6HdFAuUdgjzNF4MXFx3CI
 9ehqbBSVlREFBvS3X30CCedKgI0FiBb1wFlCgWPuOQ3TA3Yc4QvBkMvhz/b4YGn7E7Oq
 DewoBIxiaiLtkzCkTzmUGPimRPZjKbD4+3CJedX4oq+gco1Eap38mFGrIAmclZvjA6kr
 rz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079404; x=1780684204;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BASaeUV+sd6PCcE49dvGbjsSrGUAqcny0XRVjurx+GA=;
 b=cCkyfX5Xn8ryH+BzlP72j7T09kAL0DKrMNm1h48N9CzrjS6QF5RC8BSOZbroGrHkDw
 p8lO44om79amAXGir7QgiVcLVFcUKs5v9mSg2CqboLc2/kdq1JJspIIL7ItIXn32O5MF
 q06JPSVySagAcLTxDJvdYX1WEtijEDFJvau55M/TYfB4kIzPMXuyiGD3oNcgPKJu53vz
 msi2P5hKdtu4q+9L0tNmZGfAeJUDR3TTcXTpz8Pv1Cd96i+G9uVo5gqPsFEU81vvIF14
 QvzstprwCePirjGO4mYUPoZpff5kvJelJX2DYiFtKuneeXOir2baABIATBfZx0MUJf8f
 RcsA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/TAzzAHdvyGEXjR6vDhADAsnepAS5ky/qQYOWTvFvZFVoE0bpbNwc4kjej/5xxpQldDpcXC6BY2HHa@nongnu.org
X-Gm-Message-State: AOJu0Yw5cXZeAQJ1LPMxeKAJbGS17WnvVr5nfowmxLc+eJD7hOw+BVm7
 qA7J5/UZzBjn/MMiTN6qitbA0gaGOE6H6WQTnetYJneNGPUBZLqu6zdu/CzEy1WDOPk1bqY0jjz
 EhDp1zMP8StNoEZlbTNh7+EwcpTrhYemXOqzzG7z+TM24NohMay5DmZyibQ==
X-Gm-Gg: Acq92OFVMW3k1TTwgo4XEBs7SNrZHpHg9l7lf8ci4TCHiGhUzwk+jKfchMbJDtFiRHf
 l45wy0XUaqgImhKvejZWdZan6D+sBgwg3vnSMHlPdxG73f8JuWXAvI0VZbnlQOB7Pm8zJmXOqWJ
 8p90tmZOMb2czt+TrGfOBVi/oJEBcNpR2m76KTnHJrNBjUTJnSh2f+NDf3NsjEqdJgHnTX/4Fc0
 yPLqiFm+gvvfxcZIF6eXgyBGOEudPBSAYorPKxJx0QK+ZD9VuS40lFFeQkIywe1EiHVVgMm8qo6
 iSF3SGShko3SMHQR/MrvmNb5ORoIVGjszPXQDj+1v/Zs/4UfpHt9hRLBQlpbS0mX1oJj8YcCe4h
 6XrJas0JlkI3Sos9xRdZAHS+LMSBozbTudTTcwwcbOBNV++m5JWor5a6eJfF5R0Gk0HN9ESzO0Y
 8HVaXeYVO6BgavP60pLWnsu6K2
X-Received: by 2002:a05:7300:2201:b0:304:e7ca:4b62 with SMTP id
 5a478bee46e88-304fa5293a8mr473956eec.3.1780079404441; 
 Fri, 29 May 2026 11:30:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2201:b0:304:e7ca:4b62 with SMTP id
 5a478bee46e88-304fa5293a8mr473923eec.3.1780079403901; 
 Fri, 29 May 2026 11:30:03 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2f2904sm2047126eec.9.2026.05.29.11.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:30:03 -0700 (PDT)
Message-ID: <305c1c53-1a3a-4413-a365-11792b5155b1@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:30:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] target/loongarch: Remove unused
 'accel/accel-cpu-target.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xrbZcrqfpgIWcCX5LgRqOZ1SN0filTa5
X-Proofpoint-GUID: xrbZcrqfpgIWcCX5LgRqOZ1SN0filTa5
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19db2d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oVxXrErn6vik3ZSoqHYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NCBTYWx0ZWRfXzn1SNv3yboOz
 Ii0CfZThrrQC2jsLW0Dm4iemFv8DqyGQ9apoKTh7XnITLKRXYsdYr/AQ1N/SE6M2SL9Lh+7E1HH
 LZtvKWQSro24uG57VkFBVa3hfy5ZEr6Dy0uCw437k4Uso1siSVKlUOOwqDZRBWqHBFhh0b4xn9M
 6b0++dRYZbb6Eg+3/eKamLjEsJ2unBSpd3UKWjouSftse5Y6DFRGhzkocqy3AmU1gN4b/kRx4HJ
 W7G8mNCcSieN3qmzHFm//61fWF5lkWCdJ8j/qBo+bz53Enojt718M41/LkG33BoVf/8UH3MSvEj
 OInTbKizbJvlEzlw6OW7A3CUVQ9wR7rKvtTR7f3ySnaqZZHxQS0cKsAYbSimLbP/UVzRARRvzj9
 uXGIB2EmJvLhvpwwEgnSj+ejE/0jp5vmhyHJD64xrbgPkIec2wMf/U2SGXUWhp385VvuP81Y5x4
 d5KiYSKLotpaD8fvuQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290184
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> "accel/accel-cpu-target.h" is to register accelerator target
> specific hooks via TypeInfo::ACCEL_CPU_NAME(), which LoongArch
> TCG frontend does not. Remove as unused header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/loongarch/tcg/tcg_cpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

