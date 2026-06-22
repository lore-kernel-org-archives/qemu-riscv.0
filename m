Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D43CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 20:56:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wblge-0005MD-3M; Mon, 22 Jun 2026 16:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblgZ-0005Ln-7U
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:56:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblgW-00081F-SU
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:56:02 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJarHa2177096
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PaP+qaMDo1CgQZrggNHNPkwszx3orazhfgdIKlt88Qg=; b=Y+BRcf0C+yaNnLZf
 Be6eQ7WJZXXMrjTlc/FaVM5jf65hBrAiFNAsR4GZRwRhr+nm0fkDPFFliaAjVPx+
 29y3nnaEcJvukZB7kTZmHXi8fIlNqHr1GIFVlZtXPE14nWPw0PoHNLcpCe1dHGTb
 7rtuvXsRtyOaSg9lGiN6/K/i8W6nfyVnaK3itF5tSAzTeIviJ3SJQ5Dk2nTDAoyW
 ZFwLiDXsivRGUhQds1WirTHbdFDbKxt/NeejS7nxZur+yJqaMyQxDpB6YHYtUwhd
 C0E98Gaa7BXonE+FKngnMlDwXAVb6gcbqqFvC97+lvEmkidnf3N7vFjZwLV4g+uu
 NeXV2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37ha82a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:55:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9158f07f5eeso813673885a.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782161759; x=1782766559; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PaP+qaMDo1CgQZrggNHNPkwszx3orazhfgdIKlt88Qg=;
 b=XyltyOxpDaRLP0S59HGDxjxT9KMfbJrzlK4+7Crmd8vwPVvkjFOS9ryStAOPYTFKr+
 k9p+tMmd9bE0bqk4TKcnGW97R49xqzfu0aL3WOQdxjPCLXwmTEZma/fLq1NuwDwj1uCd
 mxuQpM2+lS8myv8GCg5skPQgg27zVhUMBDLfwMKo+QJ7wJ6BKNfrDNQiV5wMMSHPpWac
 F/ysdJka/avXN4f6EXQwH6Coy2OYjuBC47QUKqKI9AbFqCn8D7uwFbCsBvnRRZEfKWf5
 g2dDyRWlbeZbrlqNqYivfQ4ZmWSGqjzZlrOJm2KUX4eWbfGhy4PbcAcOB1qKJR1t/yHV
 v9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782161759; x=1782766559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PaP+qaMDo1CgQZrggNHNPkwszx3orazhfgdIKlt88Qg=;
 b=RJpT3EMHDKOvYhPZKh9spK0AvZZNsvp7embKhtdpKc1xp9DtGhiD54SAniyPsj6OCd
 tqV5StxpP0ulcOexRbOmH4S4EW8wqj0eCoSmyoGc4yPqGEA8jufg0jbgv+nf6kX5tntD
 Q+k5+gm/+a/a9Nd+qQK1l49uzXzooM8PT4bQrOuT08dBgZLSsEiianHUUM0EEr7VHNUt
 CnPKahdHx5Ugjep21QWnT2QKN8mKJsmspZWZk277dkM3NG/i8DyIJXZRCzSWnLIMLrh0
 /rZcq8QMM3Xj44ue+P3J+TIjhWY12jq2HTIeBsaLhcAqSXJoy95rRqRRakAeuEDiEBgB
 Pvag==
X-Gm-Message-State: AOJu0YxaaQE9/DilTh2ScPebBlbISk7/UehI4DAeI7c300bMPzWUDuhJ
 K+bKnBKRVchUeYCQXoFfOH6/S9QDsnIX+nLsd9CCkbvzRhM6EkGWJSw7ddV0FYdBhtxYl8Kd9LT
 PBqrggnZ48BGECUTnyEMLAR+Lf6UBFSgVutnWK9jwxSIYDy06R8TwGF3j2g==
X-Gm-Gg: AfdE7cnMoqhvw8s+PjtcIUPo/hCvEWAvd9QwOXq9QCCKH27JHqLQEZVer9OWdubtLJs
 x/pGeZiqydaIc5cAa3fY0m6maZ2g0NAYGeFAF0ZX+RGybPkEq+3PwcETdhedCxQQYo/Gzh+kwa9
 H1Wqc5Be10+YEYESinHDZvbh7eBcwOQtyaAhHK/U+ly3zYwHqlH53kGtyjnfvm5MHNDUZ0FLYJK
 QJwCcAUU7QIujbSYLh5tasNpIvnLb7ChDR6rQhn6/8e7lwcImDHfWjwjCauBzXwTYMc9lQfKjv0
 xLMlVTOD2mj7R1GnFqCfgm7NRjJjbXYDjaLvGU2hFDzqRdVallqFRouwAU1JJ1r/2QcriT+ajj5
 5Fs2mrb2fe5nuhKD1bFyoycZ/ch0CblQS4DiSZos15//KzrrKRs/8AJeL/tYi4w==
X-Received: by 2002:a05:620a:2996:b0:915:fb92:d599 with SMTP id
 af79cd13be357-926454bed4cmr26326085a.25.1782161758928; 
 Mon, 22 Jun 2026 13:55:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2996:b0:915:fb92:d599 with SMTP id
 af79cd13be357-926454bed4cmr26319085a.25.1782161758326; 
 Mon, 22 Jun 2026 13:55:58 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240ee9bc2sm228876925e9.1.2026.06.22.13.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 13:55:57 -0700 (PDT)
Message-ID: <ac42dc66-e9af-4633-b569-9839343bee01@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 22:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] target/riscv: move debug.h to tcg subdir
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-8-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-8-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: utWVcgeTYNoC9Pj3vVnTcunxJIW7nmND
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a39a15f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfX22pr/awO8+2n
 cZks9iIOGmcEeSTByYkltD5BGP6L5SzxkrZDxe22CsD8+nNwZCZDLM9bWiszuSGrw3PZOW92+Rg
 hVdD1ef5SCGx2vsmaMSsUxLxt2XrvwI=
X-Proofpoint-GUID: utWVcgeTYNoC9Pj3vVnTcunxJIW7nmND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfX9WPIo5I5K6s4
 Hir/MWX6eTMBpDMtvEKVclA5Nxg4Kf7uCEK5hhh9mgtiUgEIAjmNN6OXf5GbPqzjhh/F5k84HNX
 4nz0PTQOn+1H17O2p2rGfmTaZvOCsrM2bxE1SaYgfPXp4sjbt/1xhd/M+XPL9NgGePLllbDxpK+
 T0mbFqoh54BU3dMJc4Wpv+hKmvO/A24gV3jbL8yqBU+cJTo69TXmZBzpMNnwfLf+J8p85h2KSwL
 8vYlgs1lOd8pOgmYFgF2FRFa7MP39Yq+QWEh8wBhn+NN+biuPaU0n3WlG5M63BCOEq+0UqHF+a5
 uSGtsqrCiP9Czm/zbTy0zY1Gh9DWaoxgGiRuSDfCcKiDdyA1bphOvOWr1rfuddeXWEMKrY7VRLG
 fx1DERF+Hua4dgZ5n3TxBMGy5yTXanHBa2jfldc2l+q4l326LWbPoHqrU0ewkXk+Q+rIWtxVQUW
 nFSbhtjLBn3qbF6skPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220202
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> riscv_trigger_* APIs are TCG only.  Wrap the usages we have of them
> in cpu.c with CONFIG_TCG.
> 
> After that we can move the header to the tcg subdir.  This will be
> enough to get this out of the way for the --disable-tcg build.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c             | 8 +++++---
>   target/riscv/machine.c         | 2 +-
>   target/riscv/tcg/cpu_helper.c  | 2 +-
>   target/riscv/tcg/csr.c         | 2 +-
>   target/riscv/tcg/debug.c       | 2 +-
>   target/riscv/{ => tcg}/debug.h | 0
>   target/riscv/tcg/tcg-cpu.c     | 2 +-
>   7 files changed, 10 insertions(+), 8 deletions(-)
>   rename target/riscv/{ => tcg}/debug.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

