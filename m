Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AD1606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgMrAIhQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FXCzTGqR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWbgd-0007ZU-NF; Thu, 26 Nov 2026 10:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWbg0-0006xo-Og
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 10:46:30 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWbfz-0008Ia-5D
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 10:46:24 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQEUtl9088368
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a/U9xVMFUIgN7644JNssHaN59LVzIuUQ0CN+in6JWnU=; b=PgMrAIhQcpVPgUJO
 Qao7/zKx6y99zbbgN8m9jtyGHEguJRldVOcKMkFDgCW/d22+GMbo3SubLcvUN5z8
 LIYOeJPKwGlRJv4zgPnPp75vQEnZbC/q+L4RP+x0/UGyRDBo3MEG3CifVJMM/ou4
 5LQd7hdcf75r34JAZimaflhbxeitO5b0u1w15uygqRWW0RQ0X3XcIvZe5ePDKPgw
 bJd9PsKBWHHkZNb5IAf3QpOFaauzi6A7v/dUaVc1lwWUaPnsKsGXo2/Dkc8A4Qi7
 MS0fMhJlVwCozWKMUv6TKQKUP+GbZUZmiy0SJuayu4fRxgVL5gyCPpYnNnd0bnUt
 kotR3w==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm81fe0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:46:21 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-8b50256700cso99590397b3.3
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795707981; x=1796312781; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=a/U9xVMFUIgN7644JNssHaN59LVzIuUQ0CN+in6JWnU=;
 b=FXCzTGqR4UAn+2s0HR7CJrtdbXrrNYEGv0HvShCDqNCQCltI64mk/QeOZfWpfoilNq
 MZ59cNogZAsHanNiA3u9hvZ+oiCypEpZ8p7rZsDFJlThv6H9q1+wTwsCy2JbCHMf+dS3
 Olp7TLal47zlWqXVK3KgYZdJqz4dTuHv/grkUSsNpUKZZzTpJYcwJRJpjsAFGlPIMuTT
 l+IkjkFlDO8eEZu8op7VOsCGv4CjQiowtpvPt6PtDp0LDahlGBrZjuHsjd1z0THkSmDb
 wHRTYRPK6Kt/P7slH8TgRyJe65j0WzwOUgPsDPMTU5OFgrGecdGbpROXQ5Z5JnuhM0xN
 GmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795707981; x=1796312781;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a/U9xVMFUIgN7644JNssHaN59LVzIuUQ0CN+in6JWnU=;
 b=z8EiKzf3LqM9dBa6b3k2PV4voSDt5m1iqdpDtdAEctkjcpk+u9t8XjvslJOYew1QoF
 B6tSozF0Yqr4HBXaTkXVRXdIg8o/LOvHZdfcStXMbVpr7N2wNZO3nARhyqFoiIU2PgYb
 DCIeQIcmDvFZDk5ZjxRzitropxKBMaOjy9IfvlSPNr08t+1G/IClFEJeONayHrB5AUwm
 ke5Y7rTHh9JY8n55TZQGzkjXiWv9iXioDKMsu0yAo6q36uyiubJROBqsjv1cC2p38cjO
 kyxYWYooUbSF/h3QOgcNYERxixHSt2WAYG/rWmhcbFBGYAHGq2hhUTlt3dGvsInQ8wR0
 I+Bg==
X-Forwarded-Encrypted: i=1;
 AL+hErExbrYg7CukcdCxLehw733TEcCAnYaut7rnRtQODs6pzOmR6BUivlYTuVY1jva8Ct+1yyjWteV0oR84@nongnu.org
X-Gm-Message-State: APuU4Z/cIYCBsAQK9TpTpi3AO/+oj5LDbSP+sxlaiv3H4kfxhxblWLyy
 kE7APceMPhawYp9QJ9aVe7ACzRVVpbXrNdUWdV4nkYGdJVchjLJil1zjNOIQzlHsDpz75K3xNlk
 D70ArrdkSvvb2qOZgTE/oM5NeyZIXVF4A9y05MJMFxwFQJSbmRIZd6uQvlw==
X-Gm-Gg: AZFdTZdGqvjkhRk5/K0CY+1+smL7UUzm9l2+hnlMx8xGIjCjOrQJjFbBZ5Op6lJ7gz5
 v1Wb+RLmMzFDTm261NaAxXmKxrVVUWs5Zhyvx2pwGVtilLY8jQG4RmbXh433zIAWw28tJfXW2QK
 6Okgpf1R6+iJvid9GnayUMTKzaRKfA9sFy3SHC3Y7h3OOJzVKs79Aimgv0P8KweD4xazmQVBIPJ
 Npls5ViyewlA+V/Vk7nTHIIfrgYZwO2djD1MKpbYBf2yh9vcJIiQxYEq6rVMT4e9OCowO3dXZcV
 rmMD8MbtyAttsENDTUSbYWlsh6pnHL/2wXER4whYd1kKvhXXVxCOCsaTNE2h4dcK/aoPZwDAr8U
 L+4/yQ7Mp8akqwX9eL64AOzpQ1tSriizyZsp6XIWG72NA34PR+Uir84Zx2XdbWntR8+bFnlPIQK
 3VEpkmYpo=
X-Received: by 2002:a05:690c:4485:b0:8b4:f2bc:7c39 with SMTP id
 00721157ae682-8b52042ee4dmr62693887b3.15.1795707981442; 
 Thu, 26 Nov 2026 07:46:21 -0800 (PST)
X-Received: by 2002:a05:690c:4485:b0:8b4:f2bc:7c39 with SMTP id
 00721157ae682-8b52042ee4dmr62693627b3.15.1795707980726; 
 Thu, 26 Nov 2026 07:46:20 -0800 (PST)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f1b2sm38305753f8f.25.2026.11.26.07.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 07:46:20 -0800 (PST)
Message-ID: <80cee4a1-80ed-47bb-99aa-d2ad65303211@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:46:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] accel/tcg: update stale comment for cpu_io_recompile
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
 <20261126143607.2374676-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261126143607.2374676-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HQCXZtKAw6AgeVyJ8sHZ2rX0b35Epof0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX0N/ZsCNHnrrs
 X+B4if8ebwpVlkvFBk1uqW2ZoGCRAOKRnXKO4S2ymx/ZH+OFMccxWd5jmM0P2W9Vsos3k2crjM0
 VeuBKHB2RqumIWZoCID6lifCGmutCr8=
X-Proofpoint-GUID: HQCXZtKAw6AgeVyJ8sHZ2rX0b35Epof0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfXwNUhqYJXhCkD
 imJ9j43ymMgipAuV5KfEtvxaWKjDPMWdeoAu3tKxrMAodzWL+M/mgEhtYsGd8uwvN8H0mM1/L4F
 Bpt5rPXNTJW08KEL/FB57Ib5qVTs3wuKz0o6+DbyBIOUAvSiQSEK+1KowEStNKMvpacBS7bn5bN
 KkjcdfZx3mk1me7GONa1x6zwsmvlUWsh+xaio9PUrMnEBm6D2HugPggpK7KRlCrThqCrhJVPDUM
 6xarZbaIuZTYAjrFjVxCHWiEQ66nr4CP9luYSuJ1ZD8Yi00PnND6E+wZij9QEPk1meUJ0RJF0K1
 NJEzSubNtMZga5v2oPF97cBjMRAlSnYp0Yz6kk+Hy4i87lwFNfz5FxpitnC7bn7ouZNikxE6Qgv
 vREinnVneZAmY9K0Bhr9WR1TThHFaXqS5yrlsoYxi8RdtAWUjxTdOBA/d0m9IY8N4NnqU+zfhpn
 CkV3TY10cgUBKXgloqw==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08544d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJAeW4rM5LkjTApEfjwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260061
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/11/26 15:36, Alex BennÃ©e wrote:
> since 18a536f1f8d6 ("accel/tcg: Always require can_do_io") we always
> trigger a recompile when we detect i/o mid-block. Update the comment
> to reflect that.
> 
> Fixes: 18a536f1f8d6 ("accel/tcg: Always require can_do_io")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/translate-all.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ea8257935ed..59991339620 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -566,8 +566,10 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
>   
>   #ifndef CONFIG_USER_ONLY
>   /*
> - * In deterministic execution mode, instructions doing device I/Os
> - * must be at the end of the TB.
> + * Instructions doing device I/Os must happen at the end
> + * of the TB as they can change system state affecting following
> + * instructions. When we detect mid-block IO we trigger a re-compile
> + * with cflags

"with the TB cflags."

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>    *
>    * Called by softmmu_template.h, with iothread mutex not held.
>    */


