Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96363606A319
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EX04zLIy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ta70RFZf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJsk1-0000QB-0m; Thu, 22 Oct 2026 09:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJsjy-0000Pk-S4
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 09:21:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJsjw-0001Fe-TA
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 09:21:54 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA07e53115681
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SHNdxMOxnSiQcm4yc/nmyMkIS38ADqQafLfwxFtiMyw=; b=EX04zLIyYAyZR8AK
 9hYm6Q1NXlPm+JSZ+ffFGTXJmHQXNgZLcGsgB2H+iDc/9X6a5BsKbjPinAAGkNyP
 ZHPzKw4E/9ebauBjxyrGYlyAjhga34eOGH1D7Kf3maHTmLpEhtuYcftf2fjLJnjQ
 1H2iAASCk7ModJU97Rf8cL2Ru4pS8ehRg90myqxplpCTfDJOXDsXCq6iZyNHc185
 1QG1ZAKBK3nmbrvKR1sPzx1oGp8hD9fgi1hUW3I5Qur6TKfmJc6LYGjl7+N8Iw//
 8DHNeqzHOKEhkNz5pMvFf0RZ5BV5+ecHacDkW+f8ZTa5T58D9un5VQ3V6/tE+oSc
 bFcoAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93buq43-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 13:21:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f1e62510cso445797385a.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675310; x=1793280110; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SHNdxMOxnSiQcm4yc/nmyMkIS38ADqQafLfwxFtiMyw=;
 b=Ta70RFZfmhCHIlcKN4qEuRkG67q/8Blr8lqgk3VOjq0hNvc7MqqTznDjiDyuqIGQYM
 17VsEha68Ub3jwWj+uCHpXJ78sbDIwPzMFLXn6qu58ze7KUoNOSm3kh3EVj308HkaKx+
 rP2+m4mwyhU6c+yH9ldhbPU/GYDETgKyWzBjygZIFMu5bcE09Eq1LMttlEWT2wMZYVfa
 DNmEx+FEQd4VA/P6CTYIOVrcS6WnYa7Ca495z3icOLQfbPEjajWoF/1ST1GwqY87ziPz
 tRWLWW4Hl5zru5yumTOpj2AIzm4aTokg7G4af6TSFgVLc2yBNij0xa5OK8HAi/wuj4tz
 4zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675310; x=1793280110;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SHNdxMOxnSiQcm4yc/nmyMkIS38ADqQafLfwxFtiMyw=;
 b=SS/fjfybUGA+0qCExDwBPU7oEXeUix8xe0SwxVhOXX6bO9udc3FJAIXhI6lCU0eV+3
 JxM/94+7dPssyLGVzZHfHByKAuDNVaRfaNtWfJQvo1sDyYaq4atf5eF/tHJNZQjU0efK
 Hi3/BUsrv/vmteOGpwoYSB8YWfjosL8YGY9ON/BQ6K/PfijeDrEYA8IsJtrac479AdQi
 3/prTelQOUDZkZFcwWN02RE5sJCbrevEFEqZYSmsXkuhptr6sEeMnKbWJdaw33QLPgwR
 jNokDi968qGERxjMcgb+cmeVDQcM60jw7DGURovfcZn+KsBLQIlqNQRG+m4AEyZr8h3k
 URdQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBykoS0wFREPNBLhp/zt92z1n42V7ct4zilX9DwAn2tsCpxkBZhC1BpLqj7h//P+RhA4DYqEzZB+82sT@nongnu.org
X-Gm-Message-State: AFq9FYIW87Ya8KLmy5aeNr2dipZVu2hj4jlcYMn67IMEhy/kb+Lhd4GJ
 FdzBGXfAKzxuni10QybWtvCkSu2acsXXgyzPr6tVqW+pNwl6G0xsPgn0HuObL6VilpLT+ka4nF+
 SmHp3luur49z9N8aVnbHtG0Pir9sdufiiLAx51l4rFTf/pBkoXMaIgIpG5Q==
X-Gm-Gg: AYBFou1Rh/cLzOtogi4ZuXDQKmH6gxhfpHQsGQVBPS78v0/VGhzxaKfxAvugZUO7ehZ
 FRDR9cITq3ns4OjRx9h02XXzzWt4ByARgq4ofXDhJ9beY1AaxWsQZmBBBhgN2IBEJbAkRwDVd1b
 NU+w4pp4KrGc7GT4hGFjuwhEYBzzafFbdIUq3wG3uhBa3aamWMR0ASan027qBtV5rjr1HlJa60Q
 MxYxQ0hj8X6DzrKMB7+80wraHcDjkGxSiE4bsIwsef6bzr3noeYi07nAN0xk7nqzA9Ifwh8JaIj
 t+tiTD1/crKmhFwG8xaSFGa1HAPoiiuek2k3N5X5+7e5xFknwCn62YWPFhs27G9nQoTp4g4FmY7
 ZFS086XDtEMx1rMDKd2f1F8eoqbsx5RrDM2t+
X-Received: by 2002:a05:620a:4886:b0:93e:c12c:9b6b with SMTP id
 af79cd13be357-93f57f82894mr829903085a.70.1792675310148; 
 Thu, 22 Oct 2026 06:21:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4886:b0:93e:c12c:9b6b with SMTP id
 af79cd13be357-93f57f82894mr829899185a.70.1792675309720; 
 Thu, 22 Oct 2026 06:21:49 -0700 (PDT)
Received: from [192.168.68.64] ([187.106.240.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f56c6f16dsm519415585a.4.2026.10.22.06.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 06:21:49 -0700 (PDT)
Message-ID: <1ce16776-3338-4b3e-8206-48c17ad1a776@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:21:45 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/cpu.c: duct tape fix for QMP + RV profiles
 introspection
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, philmd@oss.qualcomm.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20261021173138.2388231-1-daniel.barboza@oss.qualcomm.com>
 <87ecdil1g3.fsf@pond.sub.org>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87ecdil1g3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX4RVzl+MfMIHI
 ioyejRoI1X+cxyTCSgVpAyFufCvuqTwYkDFINCNEeYc8GUFQJIkC7D+lF3oB2vdz7olVJ+SwjHL
 D+his8r3sbGCq7hz0gUTTmE0hilTdUA=
X-Proofpoint-GUID: 03qJ7eIFe41IZc66TGIUj4QjTsJ6kk5q
X-Proofpoint-ORIG-GUID: 03qJ7eIFe41IZc66TGIUj4QjTsJ6kk5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX5VcbCfgfvKIr
 /94K5ia18wIKsK4JnHNstwTljsSKLCer3IVa25sFOhNrgl9PPjJMbe3Vvz5sJ3XovGZyVNJAauJ
 uNY27Wfsp0oLwW7erY8QeFV6ClRZ2f/uWIHJPXAMUp3m0K+5q4ThnrWy8FuKsOd78X8VH+bVYU/
 0xGjdchfUD9t7R3c26GhHc9KoxLWmRG9aQLHqBPfBuLPA2YrU19yLiLS7djUvG6YS5oAEDIp0y9
 nJLbyqnBSYacgetbnC5NO7U4RseKRqgQDcjXMB8uQAgw5cYWfUw2/e44Ga/DuXluHBoMyFka6P8
 fibNxpx2HPv40Up+7XaJPXknKxz+J7t0CMu5F7g1t97SB6vxrJyHMgQdOeIu0LlIm5JiKolL6c8
 7qifGdADXUGIaX6pA4i37DvCWMEcSw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0dee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7SJRNfuEitxYTu7vBacxyQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=ZiMIAIO6AAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=WOXBTGftTibl2L6nbU4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=KohFQSMcaiS2QNUyYz07:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/2026 3:00 AM, Markus Armbruster wrote:
> Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com> writes:
> 
>> Maruks reported in [1] a problem with QMP introspection with

Just now noticed the typo :D


Alistair, can you fix it in-tree or should I re-send?  Thanks,

Daniel

>> qemu-system-riscv64 that happens after querying a profile CPU.  QEMU
>> crashes hitting an abort during satp_mode logic that, somehow, is being
>> triggered via profile code.
>>
>> For every profile CPU that goes through init we're setting an 'enabled'
>> flag in the static RISCVProfile object.  This sounded like an okay idea
>> back when profiles were introduced, but now we've realized that QMP will
>> querying CPUs without exiting the QEMU process while also going multiple
>> times through cpu_init() and friends.  The result is that we're in a
>> situation where we have runtime information being stored in static arrays
>> that persists between CPU definitions being introspected.
>>
>> A proper fix is to get rid of profile->enabled and turn profiles into
>> cpu->cfg flags like we do with every other extension.  Unfortunately
>> we've been using profile->enabled for lots of things and a redesign
>> would be in order, one which I'm not comfortable doing right now - we're
>> too close to the QEMU 11.2 code freeze for such a change.
>>
>> For now let's silver tape a fix in cpu_init() to reset profile->enabled
>> for all available profiles.  We'll do a proper redesign in the next
>> release cycle.
>>
>> [1] https://lore.kernel.org/qemu-devel/87ld7rmdi6.fsf@pond.sub.org/
>>
>> Reported-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> 
> That was quick, thank you!
> 
> Tested-by: Markus Armbruster <armbru@redhat.com>
> 


