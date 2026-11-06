Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930D606A31B
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 02:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1hWlfSi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP9eM-0003mg-Nx; Thu, 05 Nov 2026 21:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1xP9eF-0003lu-Ku
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 21:25:49 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1xP9eB-0004xT-HU
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 21:25:46 -0500
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-945ae2daa3eso22811985a.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 18:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931937; cv=none;
 d=google.com; s=arc-20260327;
 b=mIkWe+qClgiIFeNJ2vAs5nG3e9vQYxeQekcvWZDrjVQUFO01W0Oy5YHrpIyPJYwlWb
 /qj6FtQzObxsyxTOWWZzDazY9TqwRF99j16avietUVziashabWf/SHp/GcpUAZWJ26b4
 58lZv8Y1mqezP0xwl0J60fBi8vmIN3LKvl5us+sWacoy653irPud2jXgUHszz2qa3JYf
 qNkjYCyHpe0P3YEoRA0l0fqBPGCehxw8DogkuibBMoHC8mgAYoUhJBB2Om7De8N+DOnE
 bGfcovxIaFKN41etgpI5vLu9FeTS+QKdtX667pI/3OV5SMKCAxsLT9s8sIEbhV+pB5oE
 NkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pgG1/WFURbop1Inpu5WXlNwvEEqh4m1m8ew99capOjc=;
 fh=saRFWbPYDwtFPagJmwesJdTaum8y4o+9ktxEnnfZljI=;
 b=pUzXxj48TW0IyEWS9q4NtCAj7NAg0+CFiaY5bXCg0IV6bgHKGR3Q2KZQgrOir4GMfE
 nCpJ9ZErbeQptjK4PmLrvWvYNqon+pgABadg8wJnHbOFysDOiHV/l9yh+2E2z4wv9lKA
 A/OFOO+orQD1hxIxh3p0jeXYdSwRQZ6yc1F0UpitR5HI30M4Jq0BKcHodyKy1Nc1J/5P
 R8qJ4c1zgXk2vlROVfUidqGi4NEqgIIUHC0Oob1T++iPXF0eCFYef0OAv2d5Si9XDdZp
 d/gvbwKcnS41jZ99NeUArfUscSpXNJQn2rv2loz49en0TSJw4MqhFJ0PL5/OrokkbLLk
 TQRg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793931937; x=1794536737; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pgG1/WFURbop1Inpu5WXlNwvEEqh4m1m8ew99capOjc=;
 b=d1hWlfSidRLJ6MKCXPbu8BhPXDG3N/ufjWYiQ7yseNpYlqn8R4mOvk9WoZr3wEEsSv
 ujEkpIRmwFGccpNQrFFQ9jz3xVkKINoqIGE9PDEZNV/yENAmIkdp86FsnWHGJH/+eTRf
 7aAnotdWGCpjboB0gQv2EcK7VaZBugvp4hxqRtwUU66V9PK/1VB0FiiQY7MWMdyVXUVk
 GhUxXRdLzJD6Ge6VxCqv2sdytMs36YVTBjTzTM7x4yE3Dw4w6YgGKiawsMjSPMEOHaoo
 Y1CfprQsPtb7WvvRSITZ7DnZQ68qTmXsKRwqnkixIdS40Ceuvh/1OAothDco9xN8IVMn
 W5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793931937; x=1794536737;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pgG1/WFURbop1Inpu5WXlNwvEEqh4m1m8ew99capOjc=;
 b=HsYRfFxko93r4dE3goZs9oKpJyBJ0Shuy/7Kid0s+7U4ZqryILgatYRHxT2MYF5rXE
 r0BRh1bPhbCS62pxWO2QTvs15CC5Vtg4zoSGMMVFeZhvL5GXohJS0qGd9z8XpDCDICPO
 3MYJ6OSHL2vSZg9DmVxgVobaHjqYJtsKe9yh4eKxbY56FwrQHee93LMY4FZFWsHn5MEm
 246PbDw2UGY7Uj1jmBc/4PRGAGGRzlCxenR0+xYGApQnQ8NCPp3frVhZugU/uz9gomaX
 gojUv/B7t7jgRBt/7psZsjqhdlJh2QlMTeIdQ0qclU73CL3zr2+PQf2HDPWGwqbR2ixO
 gYXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxuIROmVHIBlPQvG7WuHxen/2uinYS3Q4wXz+Mn73cAi//2P0SWN6q8H3gxJQCPmdQEoihw6oelguzd@nongnu.org
X-Gm-Message-State: APuU4Z/r68kd7e4uQe9a7Wh22nQeSLI8xOu4GQrb5eBakYKN2mNxuYzs
 CgxdNzmzGwAlQ6iCaVxjaeuTO1dx928EUVjeFeg45wRTtzbqj3h9ECudhG+GrbAWiXjFFUd5xoj
 EIszU9SVF7cAkBmAV7T2Tv1ROX5CsBKk=
X-Gm-Gg: AYBFou3bulFeQcYAhojn84WV+Wxcho62qnx7T48x0U1UqI1oWlNugUafetD2/1wedtH
 AS5nPlr/T9xbvqCBjkBpVKXy4zEp54ZFtVuncFYQc6wfUuntCs1ALxuXk5bt7RIup6civb8b1Nu
 WnVZxH7qrkHT+FE4H4qNwJSeQf4/GJ0cNQGEQJnxlH4+CvZNMPY1GHmcskmrq4ce9IwnOiax4cN
 t3Kz28/HSBg6UGKu320qj77YGtDvs6xVSz58VxXS0RB5guSqb3C+h+ObabRX7gWKHvvPmipYJpw
 kaUS9ZQ7qO+0Okd51JyAczGdt4XkBZ9tjqTPJnRIjE3Pif7hChYnpCOol2jJGzH4KdXOT2kGSdr
 C86EVEqT1gBO7RHiFU43pUqROMpeiyIEB+sIWQZTPrsRekjcL7sccwgOIv/gLecHlP5KDmSSqmn
 zoyq9ed+BWVfCcegiL4ZMQTMmNS0rF+ifLFtzhpe0hdHIHsJUDsWYlXbs=
X-Received: by 2002:a05:620a:84c9:b0:93e:c12c:f142 with SMTP id
 af79cd13be357-945f356285fmr159770085a.76.1793931937256; Thu, 05 Nov 2026
 18:25:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-14-philmd@oss.qualcomm.com>
In-Reply-To: <20261105125203.40320-14-philmd@oss.qualcomm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 5 Nov 2026 18:25:26 -0800
X-Gm-Features: AclHuK_IrN3GhLnbigIJYmu1h8-wxESrCor66rb-AwgS7YcweErE8fkX0fydS1I
Message-ID: <CAMo8BfLMaWO=7t9uL_eS=L-KvUpOtj3S7J_htZ8jYVKps-bjPQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] target/xtensa: Replace deprecated sprintf() with
 snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.993, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 4:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Replace sprintf() by safer snprintf() to format ISA error
> message, silencing -Wdeprecated-declarations produced by
> Apple clang 17.0.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/xtensa/xtensa-isa.c | 50 +++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 19 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

