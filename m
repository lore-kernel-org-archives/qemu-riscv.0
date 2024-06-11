Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48EFC25B76
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 10:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sGyPd-0000jO-8a; Tue, 11 Jun 2024 06:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sGyPY-0000i0-HE
 for qemu-riscv@nongnu.org; Tue, 11 Jun 2024 06:07:30 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sGyPW-0006E4-6z
 for qemu-riscv@nongnu.org; Tue, 11 Jun 2024 06:07:28 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso100642566b.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Jun 2024 03:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718100444; x=1718705244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/a5FtD6rQV+VlTF/jdGlUtxkFwtZpYBmDFOOJ7ZNAMA=;
 b=ErF2NOK1CSbUGbdIu0g1bVUrsC3IF8SO4M6atSLrMzPwc1sTL8OEzRs4S0xM8h+C3z
 UuuSvwUJHH1HHHwWgFnOOgr0CciCjiZjkLaozKlAE56aQzgXytrJW4jbOpkWWjdvmcgu
 rs5PYhJaqVm414QH8yUiveSujlFYzGwWUyhzcPtJKtsg4Xy4XG/jky7zKIogR350nwOm
 e2sHux+N5G0alSZtZVFYy94Zn4MvxyhuWtt5bs862veZ5ltDVs8ewinsh6uOfh82tyst
 LK3cSc0PXzH3sNdiHPRShPXD3MRZRrcHow23X+CPP7b5fh5fca20kshe9L+mEe8EhKDv
 C8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718100444; x=1718705244;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/a5FtD6rQV+VlTF/jdGlUtxkFwtZpYBmDFOOJ7ZNAMA=;
 b=jZeQJoRBbZhKwPfausMQSBjSl8AqbEPL+lHCzHl238Jme5HwRDF7jZ65Ck3ArnICwr
 KwP08flrcY54ssVjhLlC1/CrarNdBtKiUqfCPgO70P4m2ZFQOx5OxaT0/cbm7/VYbaIg
 n0BrLB66YFvqOR+kWZHfvpwdWjnYv5oZW5n0BgLCM571ud70UrJt1k7mJT6iNFyKIyZu
 zmh3bF0Gbvkp7vgBdMdbXjfFRNXbx2a5I5R7B+mthcMAKGB7TD62NRV4M9eVcJELQzmI
 DrV7qgSOfycPmBatR/NAp9aF2LyqVvpzVeHqDidmf6ckcvwRyCg0aw94ULzSBVgMxP99
 c6kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL5rpt9VaZyq+FNhrGNj4xKAyLvWAbcKl37GUqNirIWrzvin90l7bt8jR04C9t4o+O34rePH7MJdSujiJei8QzB8aDy7I=
X-Gm-Message-State: AOJu0YwRJa7ZeQ4kPYZPEP0p4cpL/3QS0NbenAUqMnXpNFUGuBhqR8cU
 KltkoSxPgOfeoUyULX7QBn//zuhk0A9iPehl4kVRt+TEoPKlbdmMNiWgMHXyL5g=
X-Google-Smtp-Source: AGHT+IEz38bzmOML/AYUwKaHhwyJTdG/Bt7w6mZ0+Gy4FBEGjVtcYiq3Oz7WY61UmkbI0d+UjH4tfQ==
X-Received: by 2002:a17:906:705:b0:a6f:1dbb:d38b with SMTP id
 a640c23a62f3a-a6f1dbbd3e7mr318969966b.28.1718100444473; 
 Tue, 11 Jun 2024 03:07:24 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0557b1c3sm431069666b.209.2024.06.11.03.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 03:07:23 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A110D5F898;
 Tue, 11 Jun 2024 11:07:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Anton Johansson <anjo@rev.ng>,  Richard Henderson
 <richard.henderson@linaro.org>,  Max Filippov <jcmvbkbc@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 0/5] semihosting: Restrict to TCG
In-Reply-To: <20240610145808.2267-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 10 Jun 2024 16:58:02
 +0200")
References: <20240610145808.2267-1-philmd@linaro.org>
Date: Tue, 11 Jun 2024 11:07:22 +0100
Message-ID: <87ed93ztb9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> v3: Address Anton's comment
> v2: Address Paolo's comment
>
> Semihosting currently uses the TCG probe_access API,
> so it is pointless to have it in the binary when TCG
> isn't.
>
> It could be implemented for other accelerators, but
> work need to be done. Meanwhile, do not enable it
> unless TCG is available.

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

