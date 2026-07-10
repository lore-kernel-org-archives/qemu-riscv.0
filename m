Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4BDC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 22:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJWZ-0002Xp-1x; Fri, 10 Jul 2026 18:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJWO-0002Lh-9E
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:16:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJWK-00045W-SE
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:16:35 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3KDp1622744
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8wQxZGyVH8pSSCrOcjhaecBK09igt7ZZxB02nS7Lm2c=; b=Fpua+oy+S43riO+i
 K90ZtqpCIE1ItmqqMBKWzogo0sw1TWRoypvYH72zt2MbCMCAwDCBjxLAxER9/2px
 ZRUwSbpDpT4EcaUa58E1d1sQBiI9th+PACN9UXbJHC0++UvQWEuZ93n3Pmh7wmGM
 p2Cn3gZX4Le7FrxVTxpU9XabweF8gBrHMYUTXmSEZ6RVJ+AMaFd5ZRdv3lLX89Wk
 0xlfIeLfpKWGOH5fh+nZn8WOWhyzW0Bc5EBKqCA4657pUoVJB9XzbEOp2x4Pr5mL
 a7Sb9AVxEpTfnn4eAFuvd/y4O/kE+noFYNg97O4ydo3WYQzi/veLyBvBjqbgDRnW
 ADI0OQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb4rm8xq7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:16:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso25185181cf.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783721790; x=1784326590; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8wQxZGyVH8pSSCrOcjhaecBK09igt7ZZxB02nS7Lm2c=;
 b=fKEDBq7M1g0rS48v5z21+5Xr6mJfHRKMZx2W/hLd+n8we8dQAu5HoRKI5E5bQecJOI
 /29VWr5mkY+vIFiWFldEURmiGyPIthQQNy4CCHiM2doqYAaPbmnVGYoOL88LZqdTMoTD
 ZRUfKRKqUr0US3K6wUxasEjhjE9UJ6sZTcqdTh/ODIWkhUp6YmLdsf5AA74k8yF0hjBb
 lVY1MBxEzV87abKyf9YvqWNfIltK7fvPyixRsAhXmoddDHI1Jb+2BQrUgxBaoQL6xVtX
 X8QPYgR/vSW3JXVCCkUhf3ehqWuViURcZ16Rppf+QFg3RtEFmUt/soPS5VO17tHtgCo0
 DS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783721790; x=1784326590;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8wQxZGyVH8pSSCrOcjhaecBK09igt7ZZxB02nS7Lm2c=;
 b=auCbf4hzB1GRrYXXPmMC65YKvtzjCBfDfdl3faxdvNmlEFdazr3BLb/wqzy0Na9c/s
 LzmlnFaCpOjrQAYCnCoVktCvz6qmYdVNR6UWyfWnVBw/iImCGTUdIfe2aotTd8aEUcYV
 d88oBASl61wwefZ3tSICxNbPa/LQWEJELF7kRYCV2ZRTkBUeoHw9LtiamVGQND106Zer
 EnyDLQb5EpWR67/XVkC7OHi8Rh0ysU0alD9REfZcA22ykiYA0JtTUxy+u32E/t0ngmny
 BvZRXcY4odA4z/M3VA/3mtL1wtk38FWyrECgeM1dYMIlKI4hsPw29sOAO386QfgOPn/l
 HZQg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVh7haSe0vRgCwKjK+gnTNuQeydAle0G7h4wvaTT3K638syvPomOe+/aAmUgzPYpXAUEbYfSbDSMq6@nongnu.org
X-Gm-Message-State: AOJu0YwKUjbzbWgtM80mJ25aOVJGyJcZ6bTDQSmNLSE4JZrcRy5pc59N
 G+RHGm8Fen4oamK1oJAKtcuO/JOfshXHklrToUKqk/lKSzmBIldAXGzl/G3dUvjXuLBCq9sGvuZ
 BMyoCmVCL7yKEyO+RRlQTEtYkYL4O0vWrfIf+Y/GI9/iWWczHCCEYzUA9FUm+nU1hLA==
X-Gm-Gg: AfdE7cnc9imB77Acv+ebne5+Lo8QmM/2mYErWmbXHYXWcn6NOM1LdenEy7zLFt3iykI
 NC+9qa/HuRYWHjYGDvVG47m+sCCFVj8lRsozWBCI4w5llzeAoB40PyIPdjwYQaD5OC2P6wpNxI5
 WMYu8x+gu2lIoLOa6hf2efznX7KFML++jyiRWTOF9wPTF4U5AYe1jB/1OV49LlpaOu9Lti90wV+
 ujkKRf9MztR3uDa5sZfHwqgyGpzK+pE/s6ZruLYKIkDLBENuOYkmY6ro1yVI95vhAQaEaD05XXV
 DmAWYUtACmc233qMaGTVWVOIp1I2NoiXG/mo0MFm73Pe305yh9xhFd0k/BHn/pBDf7dU7JEnPfi
 QHmvpBNqPr0aoFNXZNhNaAcaYK8EZOVSTBLQo9StXHZ9YtJQLS2SqQfRno6AbDQ==
X-Received: by 2002:a05:622a:8c3:b0:51c:a9a:b0ed with SMTP id
 d75a77b69052e-51cbf162888mr8719691cf.26.1783721790139; 
 Fri, 10 Jul 2026 15:16:30 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:51c:a9a:b0ed with SMTP id
 d75a77b69052e-51cbf162888mr8719361cf.26.1783721789717; 
 Fri, 10 Jul 2026 15:16:29 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa09608d4sm64708519f8f.25.2026.07.10.15.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:16:29 -0700 (PDT)
Message-ID: <4e32a317-ffe7-42c5-b40f-96cb6b2ffbed@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 46/51] accel/tcg: Drop stale assert for vaddr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dwyZ3yXjBcA0iUYhK6wQanXPe0uOb5s2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMyBTYWx0ZWRfX19xh6ge+K7zZ
 +lKMmqI+vUN2AZwjiTNPUzG+hCkCWv4jK0C7WA7Fl+/t1Jwu0HbsZR8sSno7ofiBHFBPr0FtrqP
 Qhyo4FkvlOtQRH+7DFyH//Ay7zqPuCiRLxF1QOILSF92e5pJD2h1FkoJUkyQac6/Vr+56KI1QNR
 PGyMYm8b6C2iMmhtsAyXpKY3w/WOTjLTFYPgCjux20skvji8GsItEQLz2HrLAi4dGw9dhZYR0rQ
 KF4qH57vEIBHLAv9cx2dcUtqwV9I6wKTZLkXRxtA9T1QIGrvcQkCPytLDwn4wr8D4cJy16AVmTR
 c5qzPRe82Ul6piqIK6J8Gk1X/JhJyY1insIzpHozRSZQwkTChMG7Tr2E/NQPwkYk03nJmRvG2zP
 TkDvTnAAQIoemRwaTS2RQNqonaPR66yIVbOgiLENFWgbOXov4kulHQoTTc8mopdxFhWRo1SXmQq
 1sqWVtV9EqBUAqKix6A==
X-Authority-Analysis: v=2.4 cv=JIYLdcKb c=1 sm=1 tr=0 ts=6a516f3f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dwyZ3yXjBcA0iUYhK6wQanXPe0uOb5s2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMyBTYWx0ZWRfX5tN8MxOpZJfG
 x/OT9ZL+GeVRp+PIQmM+UgeskUpyDYmB7eA3hhc9FOx6rK29ZfORxL6Vp//mb6D26sq3vQlEuCn
 0NIeCbJ088e0Qc3a9uJJyyZCtUee/oc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100223
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
> We no longer support 32-bit hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

