Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iq3bF-0004bg-Om
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jan 2020 18:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iq3bD-0004XD-CM
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 18:21:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iq3bC-0007gK-8G
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 18:21:51 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37950)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iq3bB-0007aq-Uv
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2020 18:21:50 -0500
Received: by mail-pl1-x643.google.com with SMTP id f20so1416040plj.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2020 15:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:cc:from:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=kp4O2WYhB8M8qVlAzWL7aiNxbf6XZnIfXB6Jtayw4L4=;
 b=RUpX9MuFG6Ns9tW/Xr3iOZeoKJxbdY3eeb3NdsmnuVTsrbzYRelZmK4G4J0SDJR3J4
 DL6NtHNwEDOaXHqar+3rIe6NDT1r5bSGp6Pf1vaaRK/iE/j4DJ/V+taQFvtXBwTrSghw
 vGTYRpAJsLodc437iqZeQDramO91KzdhBhmIumZPspc0UCOaAb6a3WFLnjVTId1X1kFd
 CIvghCeSInE1D9w+26Z61JVWG2O+DiDknm7kHezm8LXv+kE5Gq9DtzM1tc0hhMf/X8h3
 53LEmH2uL3UB8Voixr1TtTg/MAO811FeE7YKOEMaFaiGZNNuuA4i9r8eWygL9zikCZiu
 /H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=kp4O2WYhB8M8qVlAzWL7aiNxbf6XZnIfXB6Jtayw4L4=;
 b=DAXBpHJr7wg10gHDsU0uzc2BMzgeatdjCz+mgnO29G4r3y/7OtzGpQCWR+013KWQe6
 fClH2zOTK5oKJ5Ldd0lmE0nd3hfrlsirID8lf0CWsZBdhS40PJEqIXQXHuY2NKpZ7BJf
 fabEKPe/knYr7WOBPoUJhNaadiyY8BDi4xUQpvPA3RZ1IIj8jIJKO/7mUVSKKznTO6GG
 qYh3xpFNvCtciekUR1ghSPk7xbM9wPAM4EHPc5N1+ygY2X//9wPqyzUS8KXqIvE7hXaT
 pJM6hRhdlLfOAbAKPpU5atsHcHjyxVJM1V5de6G3NyVwqh+QTCcNckbS07GKhwHXcFXR
 7lHQ==
X-Gm-Message-State: APjAAAWgiRv+088igG1ctycFJExqn0yW3t7nSaKhfCOuDfMXGUhUgAlY
 CHcLVrlFdcLSXzx1nv71sJ9lHA==
X-Google-Smtp-Source: APXvYqz6xXUJ4zZZpOTSaL1cVn4+QLeQO/6XZJYY6tfdUGJNavPb6Q34Zd5A/E97ytkTnzzkh/y0fQ==
X-Received: by 2002:a17:902:b083:: with SMTP id
 p3mr1156648plr.141.1578698508540; 
 Fri, 10 Jan 2020 15:21:48 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id z6sm4232940pfa.155.2020.01.10.15.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:21:48 -0800 (PST)
Date: Fri, 10 Jan 2020 15:21:48 -0800 (PST)
X-Google-Original-Date: Fri, 10 Jan 2020 15:15:14 PST (-0800)
Subject: Re: [PATCH v1 20/36] target/riscv: Add support for virtual interrupt
 setting
CC: Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: richard.henderson@linaro.org
In-Reply-To: <200650e5-cb77-0518-8f27-30d0cf23de22@linaro.org>
References: <200650e5-cb77-0518-8f27-30d0cf23de22@linaro.org>
 <2389483485d4642a6e5670e2546c62e493e91fd6.1575914822.git.alistair.francis@wdc.com>
 <cover.1575914822.git.alistair.francis@wdc.com>
 <mhng-6814f8b9-d54a-4663-900c-83023307a658@palmerdabbelt-glaptop>
Message-ID: <mhng-ea44da17-abec-4d68-b276-9ac8cd3e18ce@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2020 23:21:52 -0000

On Wed, 08 Jan 2020 18:33:40 PST (-0800), richard.henderson@linaro.org wrote:
> On 1/9/20 11:49 AM, Palmer Dabbelt wrote:
>>> +    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
>>
>> Isn't "-unsigned" implementation defined?  I can't get GCC to throw a warning
>> and it was already there, so maybe I'm just wrong?
>
> (1) You're confusing implementation defined with undefined, and unsigned
> arithmetic is the former not the latter.
>
> (2) There is no such thing as ones-compliment or sign-magnitude integer
> hardware anymore, so for this case "implementation defined" is in fact universal.
>
> (3) We build with -fwrapv, so we're explicitly asking for sane behaviour from
> our signed types as well.

Ah, thanks -- I didn't know we had -fwrapv.  In that case we're safe!

>
>
> r~

