Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C92CD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:37:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT24R-0005Wm-7a; Fri, 29 May 2026 14:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT24P-0005UI-PN
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:36:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT24M-00013k-JG
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:36:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Lhx030013
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jwetY48q6jZKjFlfIkES0/E/aJ1gDs1xBquYmzI+n/I=; b=fz/XNF6/GfXjQFNX
 0UfcuCtloIVagGtD2+GvOtQGw8+Qf7lrJtaNYE5Ixumx2tn12ObRsAyZEVbu0S2N
 F/9QInpSsmfg/5zHR04qy+juDSw/qCvhDvgkZnKTXXkvqduFaUOBn8u3wPeLiSPo
 uthc5JZEmuTo+Ab1x0L2ZTnPWeOdqgeyd6tKbwF/dqfP7rctsFD5/YKEG1XChL6d
 pfVErFptt7TYD9Jbt2yc6xxxWFcX8Lm8JZf0rjl9F6cctSM3MHXFQlIMGtGQyT8p
 ltL+Ow1mQxjGnJtsQxQFWyZ55W7s2U6UY9HQ6H9Mor5LKNJzUx/XrYkcQvSQNDXF
 QiNkkA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumwe52-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:36:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1353a6f29deso4810019c88.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079789; x=1780684589; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jwetY48q6jZKjFlfIkES0/E/aJ1gDs1xBquYmzI+n/I=;
 b=P+0hsr6jAXz4I4dd/OxFM+tjUpbdwuwysKg/KWI0Li4Xh9o55FEKgFc4HH5hNFDjGp
 7kg5voGWpbqZIaZiENIMuoOkxx02FnrBUmRknO8FZF4pMYnlPE798u3jiY2OxZq1ZkOH
 KrlHy1ntLnASD4NXhMVpWyeAhRky3pvo/J0X6CoE/74MW9VJ9PSE7n69AV4RhL86zGzG
 POV/cV9HuP4ods0fqsY8zngJv3qf71UfaVZ/arzd0uoLKNJLdUIsBW/QKASgklTWFBbD
 1BJ/GlYaq6JHof7iSxoo/WBx+/7poFwmnReT2MtLPttjJNbInmnQSiDkkywaZeAQUGXE
 ThHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079789; x=1780684589;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jwetY48q6jZKjFlfIkES0/E/aJ1gDs1xBquYmzI+n/I=;
 b=Zdqvj1oh0PUtsZvaUA5vFheh6b3aA070GAtv0TucdVx3wGcwcEhUnUvA+5oHrbLKZl
 sIH4GU5YdAriE+gp5uiVHIzOvvezTardkB3nXSXYE5+rfR2hyWaYsDzshHcVX5UBI9tR
 cmHgG2pxOA3NWo1kK1acAu9VnASU8ZM6bwUUbRyaM6wtMpx0PAvc2lQbhFyNhaTAmvSN
 RlHAp23frdFr0b5wDMmGpWZx3LxGVaVVxJCj8ZuoDYhPfnsDj++Qe4yn0qt2crHSXdGX
 XK11XZ9bH+TeATe7e45AaZbnABvC8II66BL8Qd6HCeiavtjvB3zUkIfVZ7K5vi3TSoWd
 cFDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ92u2CZw7o/fNY+2vYNWlaqCTOGsdIGwHZBT/JJ//MQrMzV0BPMK36FzYdhkcwzi6nM9BNX5FamaPfq@nongnu.org
X-Gm-Message-State: AOJu0YwFNXMclbHLB9ZN8FdAp0wC1HIdyuOMVfXJ4sLa/o5a0cpVwU9d
 ieudeqt0//bMD4D2ztbUXx0DdePjFhxwGmuZzSc4ROElOBfCDpAqbfI3A5R4B1fepQaaBetZsyx
 B6ix+f1fczBWkgHldjGRpsRsouuIKmSqz1tHfULW7Bey8rIaDZr8DJLxvOA==
X-Gm-Gg: Acq92OHeup7ixmyJLuSi3RWyNSrQj0KuTsQW4y+4DbXwVOxkcegkpX9u25PGEvq+J71
 LZDHbRZAPYZ3Z7IBEq/+pS0wIhcvGHm/8HjCes/aERPxMdxXF1Z04hEWke/hzu53nmdPq/sgyqW
 BfPI84c8+WNCLCg1OsZCBGLcr+BCR6qrze2lMwNjMbXNqV0dB++ilw+csRCLQjNFJBx1YwMrA2g
 wiMw3m2tBr38EelFUXLgHYfdvUzzg/brDouuJLJt0GjQp0nUxR+J2KGLxjSpz/7FbXmnCLxpxAq
 wp4Az5bAB0iDKXvmeZ/enRw1I2RP5Vm6/NYAKKGZ2nt4zaGy4O2beSb/vBa2bpiSStvGJMr93eW
 P9PHS+OSGGwpimkcZevOqNFi3uyr8SlNIsq4e0OIFxdYtEA3uNITrTX35ylTP2ghq+rKoCIyxc+
 dz30jlxBHOjPVpY/GOx4XiZYjJ
X-Received: by 2002:a05:7022:503:b0:136:4a60:43ce with SMTP id
 a92af1059eb24-137d3e11dccmr448174c88.11.1780079788534; 
 Fri, 29 May 2026 11:36:28 -0700 (PDT)
X-Received: by 2002:a05:7022:503:b0:136:4a60:43ce with SMTP id
 a92af1059eb24-137d3e11dccmr448155c88.11.1780079788022; 
 Fri, 29 May 2026 11:36:28 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b36af6edsm1682252c88.5.2026.05.29.11.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:36:27 -0700 (PDT)
Message-ID: <7f3da38a-96d0-496c-8c8e-e8a51624fdaf@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:36:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] accel/nvmm: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
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
 <20260529142434.87880-9-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y-DbGUJjyeAhINxjIxLyDVNVgl0tUbVl
X-Proofpoint-ORIG-GUID: y-DbGUJjyeAhINxjIxLyDVNVgl0tUbVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX0ACuVx05x3Sd
 vrbBOhxhtuf9qMwhy2u9pxYh6D4FD4r+3ADK32wBVKaRrzUWzOLxqiiDiw3ouXeKCjiUc2DayH+
 ypq2ejnMUc8ViMz7+L9I882SL3zbfKhmyQGK1B9jLPMm+XO/R1jTQ1mNbjopGHfS0ffNu1SegTN
 X9+NYzdyuTjKj5qwfAqGdATnYlTuGQB9uj155njXuvHqr2WVjb0SZ0jaMiywkqGIM4+QC/c444M
 L7I+RkYHvyAJD3//dKfMh5XbFtY5sQFckprTvSwbLPOTbQvEqSnjvpphzilDFLYz8VWLuygAw4S
 TvTxSixn90cYcpXUdKedn8Si5awey3VaRm4PkjQwSASTv8Dx9syLwGWYHoQdEDnxRmjq1DEHW1Z
 ALXbag356OIFgE6ybB5bosbrr/03eCexwKWuSrs/+ddr0MJebEonf0EadrYEhYG0HakJ2acwJvW
 GXLFKG1MVJ5yOevygnA==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a19dcad cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Kyjw8ylCigwU-0_J9SUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
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
> Register the new AccelOpsClass::cpu_instance_init hook.
> 
> ACCEL_CPU_NAME("nvmm") TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/nvmm/nvmm-accel-ops.h |  2 ++
>  target/i386/nvmm/nvmm-accel-ops.c |  2 ++
>  target/i386/nvmm/nvmm-all.c       | 19 +------------------
>  3 files changed, 5 insertions(+), 18 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

