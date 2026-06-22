Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B8CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:08:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wblsq-0001DA-Mp; Mon, 22 Jun 2026 17:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblsk-0001A3-9N
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:08:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblsi-0002v9-NY
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:08:37 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJaDYB2101410
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E4rBDsOVNbMJVsJ4x/8iSPOejvhAz4cEKQXLfEFx+UY=; b=HqI6A+7L06bLy1KI
 q7eriX/E+u7FZkzHl9YFlYC5js3B0Kq2pwKHbq7EX9VrPgo0n3G9ybIxFjJuTlyR
 iaN3EgEzFPOP3rCkjle9E8qjOzxm7YHVg0HDcKTBtdeiKKn+eMUgYx3EK3ESpX8i
 2rbsNXWhj+D2PmV83ZUc0vHiKp7jAPTkl6JBOLJgSuzHUT8xBKp5klS4kplXykXS
 SMU5PBNoZQzqJLnhul+dNBRwuvKiHU+76DSIFHp4j25MOpjSHKfYx410PYy1cqJ1
 tlbGcWSqtae7f7FqQKY+IkAu4jXkPc6+C/8u2Op0c5yJ1UQjf7oUJiHfNmYuwTYO
 tKemMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eba7at-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:08:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9159c4b210aso62682985a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 14:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782162515; x=1782767315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E4rBDsOVNbMJVsJ4x/8iSPOejvhAz4cEKQXLfEFx+UY=;
 b=Fv/zfz3bVp+FD/OdgJ/9SngW9Z6RGr7shgGP5MOLDjCH+zRWTWx5lZ8zM+Zg5bvGce
 ru0uIg2IxbtWw8FdquYckaX/ia+n9m/D9Ys/PqrE9+92AtlKsWVxQQeq17CWvI87uClQ
 /z71kWySvauaYpg7KHKWV4FMi/v/4qgnEWo991Cg4CPFc00qO9+POuBr6Vx8CqTqADJ8
 WWY58lAO1ByPXwTUXsS8Z0588gVRTreeD3LAJjIqZe2YiwlVI9lErl77s2DySmkw4nOB
 nSPCAtbSTwXdarnK3jP035G/LGimwCFxF6YfqWQaXRdDyBEfe79FQV22ON2zIcLYkVNp
 dfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782162515; x=1782767315;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E4rBDsOVNbMJVsJ4x/8iSPOejvhAz4cEKQXLfEFx+UY=;
 b=RplQJTYxUImCFGaduVHOlbQOyEsjBwK9I3Pgp1G7xBDD4wrwqQX6jOBcmfdWWUftoI
 MgT9cZpLXywvDz4UXNYVvGHnEHNngBvzl+KcrXeI03nhLjnbvfadGspOXDHcPwuPB5gJ
 Ca+NTvOVqxMibJxXpxlETJwvN6Rhcceex/trP8iZorkgWlhQ6AS+L99RcjbaPXUFD6xK
 mWP11osgle2YkK0p7g34vDhBKJDRQ99ZOt0MoH0CQHzmzk93a7PrUE4+e6+troFhYpPD
 eVlb0Y993QzoFSNBsLfd9GzkSVrNXffX0gBu1b5iZQtTzxv0LrIjgqqsyxmUgUqYG0iG
 qJOg==
X-Gm-Message-State: AOJu0Yz/vGAndliW501R62VvQfwRMKBXAFykr1AeEYvOTDMPv/7sr78I
 AUSW4v74960M1AW5BwJwb04JB2m6vlCsnlI2jn87KwH7Q/zBWrlfeIZ77K5IPapfmu2ph/2KAHT
 Vvgx5+yDBpyWsWTPJhhHcYjFJB/nFs/48OsSdNf7Xk7DvRjnkvUEPNxRSOg==
X-Gm-Gg: AfdE7clsncQoonl9tutgmXTzDqKcBlF5QQ+piXwnrENpoiu8QR1BrWoJ5ysVcS/uwMb
 K4h7mQY2KbIAX1Xu9cCHEbY6oCrSpt9pWzzG59Hd4JQioPwKC1/g6edRMHqV1oQkxyaBDfuc2KL
 H4tDgTmBpl2Ag2JjdCGJu/zy3aItkAfj5trSw5+klMNXdJwC+Mmf4rT8OJA13jNKdMbLdeOCADl
 hmHu5jkjUaVfzBKnHPI+qWZX3l8wyKRB18XIqE9YOpyvIj9034lKHlsjlBOR6ZVNg387RFgW5Vj
 HNMv/L+wI4iDVADqFI4TSdKufUhAW+f+IgngRK6c4YDmXeNXEvSsfGykUxlMPKtOanyq0uYvvkd
 kzktPwpMO/4CIK1qiWO1eidKiclShDy/YHote3P9s2keSJSnYzxiSkyD4TEo3tQ==
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id
 af79cd13be357-92600a83287mr218049685a.17.1782162515180; 
 Mon, 22 Jun 2026 14:08:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id
 af79cd13be357-92600a83287mr218044485a.17.1782162514741; 
 Mon, 22 Jun 2026 14:08:34 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0c5e49aa07sm413490566b.10.2026.06.22.14.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:08:34 -0700 (PDT)
Message-ID: <f109e930-3470-44b6-9177-c937e3be817e@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] target/riscv: move riscv_cpu_claim_interrupts to
 cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-15-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-15-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwNCBTYWx0ZWRfX5nH/1XMeCGn1
 IGNYSFuyHshv3XmFifJgBpX4JtdslVHsbImiS0sNY2gXuvGPqNjYrYgy6xfpkenFyaBdy4QEJb9
 d9PF6yRkIj4MM2+nVy3uq/bUgdWpCck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwNCBTYWx0ZWRfX3Qf8RPo5f0Pk
 40gScvhqRhAwoiObn77HuTDhmsy4HFHZLpwsiFUDMIJY4ooXZvyxJAJUONUJmv3uiWmXm0LkYYd
 rkqNyFRkmDufqWgx7/y/3So50iUWqVrBoNByhhvpHItXxdQxhmAseewEyleGBFTSokcrAwViVFq
 SbwJkNk7Udb2uwyG2ZYV3Mbr2TmxeYbfs7dp2Z+fUO3Dlho94GLyZst+rWs4F8k4goHOwDXHQlj
 TVkUmbL5xVWTxxs7yF6eI54d1tThiYn35VBw8TU/zSCLadhnRqDzKHTjE9LMDzkGfgSxC9SYVlU
 3l3ohWKm+3EhlwJqqrzPjifx68DEtG0MJVlG6UTo2al2dwh1ARkhYHZgQFCvQPrQynzy3RsBfFf
 ERkVGsL7KtiGMO8c/CFXX/iy9/dNtE+Ds9xjf3S/LLQvOUTHaVlBl2YRQEjjvr9r+laHp+1AulY
 +jIoALITKKpjoR6ND0g==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a39a453 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 603mMULNPJlv877EuXgOgtCtN7G_f14K
X-Proofpoint-ORIG-GUID: 603mMULNPJlv877EuXgOgtCtN7G_f14K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220204
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> The function is used by hw/intc/ files that KVM cares about like
> riscv_aplic.c.  Move it to cpu.c to be accessible for --disable-tcg
> builds.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c            | 14 ++++++++++++++
>   target/riscv/tcg/cpu_helper.c | 11 -----------
>   2 files changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

