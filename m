Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4127A606B22F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOohF5z5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8d4nrpI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRvPT-00082B-HX; Fri, 13 Nov 2026 12:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRvPR-00081b-Cj
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 12:49:57 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRvPP-0000y1-HM
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 12:49:57 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ADFRPxI1725189
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 17:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QvxqG3ywbeJpFWc1K8KtGk4tlviuG2uRi2YgeArtn4s=; b=mOohF5z5/YHhdO4Y
 e7uTYmxvfzkVKkph8bKd5EiCfVnnSjll/19PXttXepV0ggoebMqJSxyMvraBhU2H
 qrbJOlPK4FEn5KUnxH/1AuK/JrlmBmoa/BwBqG1TVHT7Iwk+F793ytugQwOVl3+d
 idcdPP7z1jwn7dKceGjWnI5Tdcg/Pokj/31AimO9eSR3rhJS+VlmJ6X/ct8rG1Ak
 0zwjAognncW8Cze03zGTlbN2jbj9vMRO1Z7H1fKBqez2mbnuXu2oiDjEPjoYX8ES
 oMBiIfpwUyI+Kz/HSSx2wT3MHKlHYIlzhpKCicOZ/SBWmG3cUp7fujg9Gbser/dC
 nkxFwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp9ent-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 17:49:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9308eafb465so353627785a.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 09:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794592193; x=1795196993; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QvxqG3ywbeJpFWc1K8KtGk4tlviuG2uRi2YgeArtn4s=;
 b=Y8d4nrpICwdkqXwlkYnkZ7DghnzlSg0KgDAqTVyRn5DrFgHuHguVF5fzSWYpXRgqW2
 sVb1lVOvvViQhYh4+6E4M7twCkK89lwI8VJR/rTzommOx9XLJVBsYNH0tCurFVA5s1mF
 CDZVsCARnZfu0VYSIXPhZtb5eG9DUpaIluTDA2xA3buSiVinyIAP+zF5WMvbRk71jz+E
 ugQTV12iO+vUJ3BB5Z+QATdDOhhQnmZu1ySMCVYryNtm1i8gffWvA/BEBwfpcWzbQl+m
 bQfJSuCv/HJPj45qBkgkKFQ6/Y5IFCL3FM8QWWddykpO7AYKk+gtAPfUqrQqEkUTzZ/c
 fx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794592193; x=1795196993;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=QvxqG3ywbeJpFWc1K8KtGk4tlviuG2uRi2YgeArtn4s=;
 b=fK6PNtnIYb9JZsAYH/vMBgGLjGW0VzxdvhVzYfmm1M4zDM9NMxZcyDvrvAyyxGiIYV
 hlbGb6+T0xoBrnZdMN9hibpbl2Prm5ns0Wh7GlvKJvizbnk3WARFe7VAPQ4UMUUtCg7d
 1icrG9cJZIy0YXYZw7QL6j+Iiwv2dXZ/14ylaF2ccFdkAfKWVmCoro+CCofwc0MJokpa
 85w2/DHQhqeslW0kAgcn+VkEOcwoTUqcx2kg5GOfEWsYjSOygjb9L3xAJzmhqlW+YYfG
 +DDF1Q1RSG98D63V8pKUbJ01M7yR8b7f/FC7CFQdQFJJI/ZDHHjltPmhplKd+cdfzX6y
 Sz6w==
X-Forwarded-Encrypted: i=1;
 AL+hErGP0xTW/m5o4qz2GYWK/jPoceTySudEgO3DBFWS0OijzO2rRQc+tGW/8MO26mOSZwjWBaNsSW92PnFG@nongnu.org
X-Gm-Message-State: APuU4Z8dTqiA0wjkvXxP/N1mBmraIKPreqH5XmqLvyKAoASy0H1XdQ2T
 0YajXKnYERka/45angx53v+GnnekI7jwgWLQ5NljwIdl/NXNa59ijv931Z3TJfkCrNdOXZuKnEp
 F8KE74yReMeQY98+YPJlK4ge5FmzPEce9QK62483AvGCMJ0JysEXKI1bjPw==
X-Gm-Gg: AYBFou2rd1y+apYDD7bTzs3icuZrByBLE+wCLATOrSAFrw2yvFJNzEAq0tsOxDAglWd
 Rp6DJVQpLR9e+n6xub+xcKFqRFMoIYO71OPSfMkP/5gflzn2yhOcgw22EuKv4bs8o4LNFVOv5n9
 SZO06ynFU17C/CMzicnn02IMhbYN4bhbAyVMKDjL92u4qcI6cMfZILh2EXQfG6nXPcWweP6uAqp
 zmSzIMn3hVTt/jNUZhZmwxJsFs9Ie5xjl+HtidxV1MNEM59s5udEoFlriJ479IW0vOL1UdK081k
 JdFuLlBT2JT3gNSXdJoP4+tlttNw/yU6GClzl7zBXCFU7YRptChKw3ds4Lm5HxeGx+zGW4hmBiY
 eS2gpaKfQW9GZq7y1UKTzk7zwAO7nd77drPca7jUCke6/Mg4ZuWpxTEKq7zVf7qoj+u/W6Kc6Ms
 3QSaaLqv8d
X-Received: by 2002:a05:620a:6410:b0:947:81e0:bd0b with SMTP id
 af79cd13be357-9494bb75b2emr525262785a.20.1794592192798; 
 Fri, 13 Nov 2026 09:49:52 -0800 (PST)
X-Received: by 2002:a05:620a:6410:b0:947:81e0:bd0b with SMTP id
 af79cd13be357-9494bb75b2emr525258785a.20.1794592192293; 
 Fri, 13 Nov 2026 09:49:52 -0800 (PST)
Received: from [192.168.68.105] ([191.202.237.20])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9494c870f31sm235608285a.27.2026.11.13.09.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 09:49:51 -0800 (PST)
Message-ID: <80cdad68-96a7-45da-aef9-53357ed8210c@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:49:49 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: make mstatus.SPELP read-only when
 S-mode is not present
To: "Christian S. Lima" <christianslima@proton.me>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20261112214810.78747-1-christianslima@proton.me>
 <20261112214810.78747-2-christianslima@proton.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261112214810.78747-2-christianslima@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af74dc1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iNxvZbmf7GYCzVQazAudjg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=4mMbV74KCpzz612BHTgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: sp5hRdxYoSa8E97XmZfw19hQo4USWVbm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MSBTYWx0ZWRfX+VLSvI8tiRBR
 IiDJQhdb6OwjrgZ2DeEAZ9KDsyNje9Pe5/Ka0sFpmCYEu1Cc9eXLjoOysOJTnvGlxzf9V0r3K5R
 TWDh9ih8lHVA/GfGmQaWjPNwiE7GqOo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MSBTYWx0ZWRfX3Vo9p/upnd7I
 S0mpAHaOhLJXQDqNvMOhvzWFSCRhUF+LcZbAQZH0jF/DFDNfn0fjj50prycDzEjk81QYtbMUqef
 d5mkMqm+yp/oHfyDZYT76UaGVUpIRIfGKnTLHnMwY7/inb4eUcb4DQl5xJSexZXIS/Jzb5Bs94G
 0OQmwqs6jW6muWlxiIM+1apfmonInqBCkAjLeCHZBpLo1kc5TvaoIXG/gur1GcNPOICMjwlCrR4
 Gs5OBbhWjPT0L9KKjudY0bfkanU0FuRVXeNro1txFg025uPHqOfhHXNDeH4NcfIq1Cy56t6q81b
 OE4cHGZK/3Uc7yghEMUv182YGnO58MmergKoIa7045kvzixUB2hU/Nf6U3PniUVJkp8Vg3t/PkJ
 uO1hvzDQPhGHF8Xot4Q4dD7Y7Ce88KJ5glxC0QdcSzbITfDfD7XJ3B0FCK5iYRvPsTEQVLOnWzd
 lxuE+7hvb+QTcdPnFIg==
X-Proofpoint-ORIG-GUID: sp5hRdxYoSa8E97XmZfw19hQo4USWVbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130071
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/12/2026 6:48 PM, Christian S. Lima wrote:
> According to the Zicfilp specification the bit SPELP in the mstatus
> register should be 0 (read-only) when s-mode is not present.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4456#note_4181630619

The code LGTM but this tag doesn't do much as is.  Gitlab uses the tag to automatically
close the issue when the patch lands upstream.  It can't do much with a comment.

Reading the bug I believe the reporter intention was to add this SPELP comment
as a follow-up of what you've done in 4456, i.e. this should be done in that same
scope.  If we upstream them separately there's a risk of Gitlab closing 4456 and,
if this patch is left behind, the reporter can notice that the bug wasn't fully
resolved and reopen it.

My suggestion is to either squash this change into the 4456 patch or send it together
as a 2 patch series.  Both are fine, as long as we upstream both changes at the
same time.


Thanks,
Daniel

> 
> Signed-off-by: Christian S. Lima <christianslima@proton.me>
> ---
>   target/riscv/tcg/csr.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f..340c61a1c4 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2124,7 +2124,10 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>   
>       /* If cfi lp extension is available, then apply cfi lp mask */
>       if (env_archcpu(env)->cfg.ext_zicfilp) {
> -        mask |= (MSTATUS_MPELP | MSTATUS_SPELP);
> +        mask |= MSTATUS_MPELP;
> +        if (riscv_has_ext(env, RVS)) {
> +            mask |= MSTATUS_SPELP;
> +        }
>       }
>   
>       mstatus = (mstatus & ~mask) | (val & mask);


