Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5911C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:38:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGXIW-0002Nw-Tg; Thu, 21 Dec 2023 23:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGXIN-0002Hp-V2; Thu, 21 Dec 2023 23:37:59 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGXIM-0006G0-I0; Thu, 21 Dec 2023 23:37:59 -0500
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3bb6fc61ce7so985947b6e.3; 
 Thu, 21 Dec 2023 20:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703219874; x=1703824674; darn=nongnu.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubXue0ZHyXpELIbpnzirK9Dyfve4h1EaxAGTUFo0d/k=;
 b=lIAsgvZK8I3EoMGyg43d8nZxR7sdPBKB7PzdcMw+TOJkxgl2c/t/Kniz/529ZTdBYV
 TRH/ZNae87B3ZBCGwMEN3ky9Xpl6QoF8mERDFVbaxkUjCiFjhNtmtLHM9QZxXwI43pfu
 4a4bMcMUrRmp5p373ntQx1CxTodE/YtaO1tFg8OWhn81On03t2pIRJouNjHpEJOK5tK/
 P3F+HvumJacsAH/nH2BFWdl3JRGBZ/gfsMcDxa0v+BFEg7FMWrUZqxANedZWCoAUjY3h
 NCVMtPOPmilSFZkkJS+50WAlhlAXnpyp5Oe+9HGCpvOSjJtkHnyrkbTsRv+257Rgd9m3
 zLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703219874; x=1703824674;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ubXue0ZHyXpELIbpnzirK9Dyfve4h1EaxAGTUFo0d/k=;
 b=i8luFN60zuU2bFLGXQsrZ5HVGJ3e+xeLYr+cWEgJ7buNdUEOWU3bAvRJ9J4uH1Zv6V
 SVFyn+EP4Ucu92vcE8QMElwcWIQGxL9PwXbk2fw+TKRx07CFBrafZhYhaj19xIgMvnty
 AGJJ2wLh/juAYQsdSqxNDoP7qaTNFmyv6fBep1ODQ/zTttA2CczA2+yPcbbBEi1hA3FS
 gNC+n4P6XFuuqwYJoCohOOfyf622qILtvm3FxVv+Xfko9EhEo8879sllYjLDpgdezmpz
 BzrSJYm5pbHcIDLMWq0FBkcloJdq6RhU43y0/1c0ueZAUtE1AgdFhc7Y8IvNqhEPw+lS
 pJBg==
X-Gm-Message-State: AOJu0YwfrPCJWqJRfSG6QVn7b5jCLxaxKC15jRfjGhkCKXGmkEj9U9Uo
 /ooTORDagzWD3e33prBUz+M=
X-Google-Smtp-Source: AGHT+IF7n4AUbnBmECv575kazZeQ++dtW9tAC2x/p6q/pARNv7y29BoLqvElYyZiMFOUNvxEZ23OQA==
X-Received: by 2002:a05:6808:128a:b0:3bb:7174:eb with SMTP id
 a10-20020a056808128a00b003bb717400ebmr926627oiw.60.1703219874450; 
 Thu, 21 Dec 2023 20:37:54 -0800 (PST)
Received: from localhost ([1.146.126.39]) by smtp.gmail.com with ESMTPSA id
 y22-20020a056a00191600b006cef521b151sm2433777pfi.168.2023.12.21.20.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 20:37:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 14:37:42 +1000
Message-Id: <CXUL1V42EKAH.2TYZ3ZFJPHGZ5@wheely>
Cc: "Ilya Leoshkevich" <iii@linux.ibm.com>, "Peter Xu" <peterx@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, "Eduardo Habkost" <eduardo@habkost.net>,
 <qemu-arm@nongnu.org>, "Paolo Bonzini" <pbonzini@redhat.com>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 <qemu-riscv@nongnu.org>, "David Hildenbrand" <david@redhat.com>, "Warner
 Losh" <imp@bsdimp.com>, "Claudio Fontana" <cfontana@suse.de>, "Brian Cain"
 <bcain@quicinc.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>, "Thomas Huth"
 <thuth@redhat.com>, =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 17/24] target/ppc/excp_helper: Avoid 'abi_ptr' in system
 emulation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-18-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-18-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=npiggin@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue Dec 12, 2023 at 7:19 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> 'abi_ptr' is a user specific type. The system emulation
> equivalent is 'target_ulong'. Use it in ppc_ldl_code()
> to emphasis this is not an user emulation function.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  target/ppc/excp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a42743a3e0..3d7c9bbf1a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -142,7 +142,7 @@ static inline bool insn_need_byteswap(CPUArchState *e=
nv)
>      return !!(env->msr & ((target_ulong)1 << MSR_LE));
>  }
> =20
> -static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
> +static uint32_t ppc_ldl_code(CPUArchState *env, target_ulong addr)
>  {
>      uint32_t insn =3D cpu_ldl_code(env, addr);
> =20


