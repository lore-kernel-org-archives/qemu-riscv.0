Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F78C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:53:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJ9S-00013e-73; Fri, 10 Jul 2026 17:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ9Q-0000u2-CH
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:52:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ9N-0006HU-KY
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:52:52 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3R681697259
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zX/ccb5htWrlRrb+eLS7rdEZ4xEiJqyH++YKHuqmqJU=; b=hFiXrz3bcAGvnQEO
 vioOWSDebk3pbYmN6tjEOy+T469L8735ei1NG5V6BhCJvh/FucLKEexwf3yGeo2Y
 BZI35FqgHRlDxOMmF1X1hBRk0NGHqBqE1zpVttJsvpbelTbyLu7Lii9FMAQr+6CM
 UJ8I2Q6t+1APr0I8k40CMyhKYHiuabNhBuPovslHYFocQuUWalpU99sJrR2AsbGn
 zTzHTbhwSJ1L7bbEivbhTpC5WvG7r7+OxnVbKS9qCenomSwG0k9GeP1PeKwk3M5F
 gp09o7LqRiBoIqeGs7H/AcsReGbmD2gaUJJbN1qt9jkXCDhUcqG7SXJW3h0r9WAe
 PJHuXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5djhfh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:52:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92d1cae5939so188528985a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720367; x=1784325167; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zX/ccb5htWrlRrb+eLS7rdEZ4xEiJqyH++YKHuqmqJU=;
 b=G4pDspgIUi7f5XYLYO9cUfGyVhXeMrGsZnt2s3fub+aggu9Egi2HQ/XqhyHWTqmE0+
 uvEOGgSr4iaXT3hIrDsHIuW69Y6PuyrP/CnllBJi7h+BJNsCooUp3W+LBTF4epKtM5Vh
 lyx+s0wcrz6kCO5Cdr13uXdL+r0k6e4RjEfTeuZKVEFm/dap9x2Kd/v9WXUbzxufWHHc
 VkZ19ModLV/o/WYUxYsY/4mroQ/ViBp0pJXZaq8rfxv1rslWsu3b9+7n/jt8ZNMwHcLa
 qj3VFPftHB7u4qSODWhradKNAwmnp+Zab4Onv7inPcfo/B94ZgfAoy3GG60UdeuUFKCP
 vxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720367; x=1784325167;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zX/ccb5htWrlRrb+eLS7rdEZ4xEiJqyH++YKHuqmqJU=;
 b=rvFSDQS/XbZPwGkjpSxvLyFM+n4thoy6BwccwxLJhGFDuqgZm52nMWpkwkYH2MNmxU
 CbmqJ66HN/4eETVuRI5nnhHJGzNy942MjkLJmqMquiJ25Pe2F4LzgTc3z2cN7eDnm+oX
 HKPgCqi9uZiIU7NME+TOaC9DzIy3YZ0iwzgullrG9ST420u/r4/5m2GcKPi0feDg1ox1
 mvfmoibhHQ70sCcdbzPVjJBKDrzJwQgP+dgzYuJv7STcH9B/ZoV5SYjIsY8v/aI48l8b
 UkT0m0ADzDArr2IQpjdT/3u9nfoByblV93hwz7aXFoysb6OyfaDygM/AP3i/wOyZ5feO
 7MKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrDAxA8MpHx3jQwkWbc5hGxpSD026CH02opIqrVruvuZ7Gqa3QgxD7opRKUJnA+VADzKRwX3ojDdr9P@nongnu.org
X-Gm-Message-State: AOJu0YzsiRdGTbJuguQcTJubMdDlyRY9GPf+Y6GwCEl4DwbKQWAk3cCZ
 e3kA+M2slWYBG719SBoKJw4mefah3RxuEY81wUW1HiaYaIm5HSEDnUFlxjTP5DBi13V9s6Wu3K0
 NUJEZvEYfyS586gS1X77kdadJj04c4tq8aXAWqum/urwFH8PR/wa11bsGEA==
X-Gm-Gg: AfdE7ckixmv9Zjd+o5ODi+/6OdxxHz1EW/u2hanMCXSm4NccJPjJf/zlb7kZp0CTFVu
 c2ZQ/neRLRQ3h/SGyWD1b9PgA6SWXPTB6meCW+oZBMqJCar+2eUEvXbf2LQJmChs8JXQ+vivtu3
 2tIgi7grFVYjoMcY5DFM0V9Pw4ut8bzZUGfbj+N0HEol/370Yd7YGTeG51KypcQvtPybZmPbm1F
 s15UgzyMzo0u36y8/DSm88NzXc6B0kAOK1n/fYLTtjteMSHnxnPTuyYezeZNXohG8n87VGkWVDV
 WOhCl0LLesFdisIJB+h4P8Zi905Y///dtSPbIIIJAknXuQ9b3REckxqXghdc5Fz6bNhFZFVsZsk
 fXnUs9AgabIArYWzgB2ApXscnICUB6AschCgbaA1WlvbQ6l5DYsHQnwaONXvMBw==
X-Received: by 2002:ac8:7f8c:0:b0:51c:135a:5b49 with SMTP id
 d75a77b69052e-51cbf0468ccmr8560501cf.4.1783720367250; 
 Fri, 10 Jul 2026 14:52:47 -0700 (PDT)
X-Received: by 2002:ac8:7f8c:0:b0:51c:135a:5b49 with SMTP id
 d75a77b69052e-51cbf0468ccmr8560311cf.4.1783720366798; 
 Fri, 10 Jul 2026 14:52:46 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccaf1sm293795655e9.2.2026.07.10.14.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:52:45 -0700 (PDT)
Message-ID: <29a22377-5e83-41eb-a327-97c4c84002b9@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/51] gdbstub: Report actual watchpoint trigger address
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfXzHvY1ICQAR80
 doQkQum0cVrP1Oms8YHifXgXK6jELwpvY91CrybC8k8ljh+6nfpwFe8V7+wVfzSUHeWO3WmYAYH
 6aLmHe5n+YLNLJSINvVZu3o//x2gUAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX2FRUtRf1UTp3
 YVDEwTHnIiHoURLiEg27KBDHT1zKfKwPy3DJBX+P4cnClR/LSfFKqt3G7+fPKTWWkGmnRH+YNx5
 /KFuZnLyVaLFSL6NzdAaDqNpyBfC1vaLuTIPpaAvpq8ET54Fw2zisQixIekMLYGns7Giy1Y0lNn
 wg/gXD2tQOr/UShFEY9bD2pbc2IpzxzcHSZOucb0RbYaGN0eyO4S1DHLRS7Ws6UD3+SQ4BVvP9O
 09JENxPNUKl1EY/Y7xIgunqczRIAQylUItzvqfXrxcpYMmkbutzuLtrDDsNY5e/2/QKLgYcgURy
 aKTvWBF1ZleyAl6L6md/ZkcqQD7P1+hRnRtNcg6vPRPj5sMSwPCqKzc74PkFUHtdbm+6grzZ41S
 J2Q474h4JGmkZAZ3KMbbfJEC96Hs36hCE7qHvUt4BH2+rjGLEQNZT2V3KuRVi9wIZc5aOhKQjU5
 Ez3TUVsmKT2M4I8MG2w==
X-Proofpoint-GUID: tYm8blnOZOgEUKtndUxF0q1qkTXj14xD
X-Proofpoint-ORIG-GUID: tYm8blnOZOgEUKtndUxF0q1qkTXj14xD
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a5169b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ge5hdUQLQkj_eIuYbJEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100219
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/7/26 22:53, Richard Henderson wrote:
> While gdb doesn't care either way, it seems more correct to
> report the address of the watchpoint hit, rather than the
> beginning of the watchpoint region.
> 
> Adjust all virtualization hosts which construct a dummy
> CPUWatchpoint structure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   gdbstub/system.c       | 4 ++--
>   target/arm/hvf/hvf.c   | 1 +
>   target/arm/kvm.c       | 1 +
>   target/i386/kvm/kvm.c  | 4 ++--
>   target/ppc/kvm.c       | 4 ++--
>   target/s390x/kvm/kvm.c | 2 +-
>   6 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

