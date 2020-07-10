Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtuUc-0004uB-KZ
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 10:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtuUa-0004rw-Qw
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 10:59:12 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtuUV-0000SO-QX
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 10:59:12 -0400
Received: by mail-wr1-x441.google.com with SMTP id k6so6285197wrn.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=TA/HkXSapHZeZe5bfTpqkCWfDhLsdsc8tqcDOZY4jlI=;
 b=aYR7a1c+34KqNLVuAfWp4pw3oBZ1VmTYI2LFh7wgswFE7Lpo161qmoSbNSsAeplwsu
 qZ600TyYleuPs3rIiOk8DDPWrB3gcoRm56dRJtjC86w07NMXAEIMeEJKmH7xikiDRjak
 NDNzT85CbnYVqmzBZ6/5yZLxwex4Gjg9+xjeVKgLYBnl2KtiY+qkfrN4p0aAIOHY4edN
 /B92GkROFP4cJQYuItaYsTHe0oCZP06N/MddfvBKL9WzMHSYPEjUlemK/wZwDc9TQ5eU
 0q7qmmPiETukUej7ahBkiRVbVty3xa81x3vZqizig5G7zkFn26u2Vw8LXNmioXoagxyu
 /bOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=TA/HkXSapHZeZe5bfTpqkCWfDhLsdsc8tqcDOZY4jlI=;
 b=MOY+R32XbChpZRN0vrP/uBBpwMGqU+7/S7vOSgkuC2zG8EOpUFBMutwu7Kz71eLs8k
 lZGExBnhL8Qc1kjjBrfRVUeMD3icLEm51ypwaj7QY4r9hVL/0fbPmLGJ4gUu3JAI3GPB
 XGm3gu6Dqe5jgPq9Bb0wpiRRHkD/I4SKXkU5COy77rsMo03pIfe8JZ+q4qjscn1O/6EI
 WWHWJFW/fnX7JqsyyDV58GMuwLHBg7rsueVLmzGHezhmTDRdOZxIYEQOsceZ8T4a0z7K
 EzZyE4IqNEPZk1W1QWUebdbv/cRmAnAbs52czu8+9nDICjSPOJl/PIOYf7eNL3FWW4fl
 Yxuw==
X-Gm-Message-State: AOAM5302ikbGi6ZA1XJYx1OU49dp8lcAllb7fTcBRHdsQGXKweym1qXd
 HBnmxLNTzVystPbSsYrzO8WH3w==
X-Google-Smtp-Source: ABdhPJyXdq5B8QVpPtA/vGhBnMsMBSDg5AHWXFSNZLjVLUgNRmQL0nqZJ0NKkSD+D9My3dMqyqPl1A==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr66296042wru.373.1594393146438; 
 Fri, 10 Jul 2020 07:59:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r8sm10186461wrp.40.2020.07.10.07.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 07:59:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 846AB1FF7E;
 Fri, 10 Jul 2020 15:59:04 +0100 (BST)
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-61-frank.chang@sifive.com>
 <87k0zblgjx.fsf@linaro.org>
 <CAE_xrPhKg1FeRwW0zS-jpfo8XL7WvSFywif27X0kAYgh044N6w@mail.gmail.com>
 <878sfrleq9.fsf@linaro.org>
 <CAE_xrPht7BytoFxLdkGk+CRr+kEyT50woe_UE5mRVHjk6=pORA@mail.gmail.com>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 60/65] softfloat: add fp16 and uint8/int8 interconvert
 functions
In-reply-to: <CAE_xrPht7BytoFxLdkGk+CRr+kEyT50woe_UE5mRVHjk6=pORA@mail.gmail.com>
Date: Fri, 10 Jul 2020 15:59:04 +0100
Message-ID: <87zh87ju13.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 10 Jul 2020 14:59:13 -0000


Frank Chang <frank.chang@sifive.com> writes:

> On Fri, Jul 10, 2020 at 8:46 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>>
>> Frank Chang <frank.chang@sifive.com> writes:
>>
>> > On Fri, Jul 10, 2020 at 8:07 PM Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg>
>> wrote:
>> >
>> >>
>> >> frank.chang@sifive.com writes:
>> >>
>> >> > From: Frank Chang <frank.chang@sifive.com>
>> >> >
>> >> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> >>
>> >> Did I miss the rest of the series somewhere?
>> >>
>> >> Otherwise this looks fine to me:
>> >>
>> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >>
>> >> If you mean float16 to uint8 and int8 conversion functions, this comm=
it
>> is
>> > everything.
>> > I think I just cc the mail based on *scripts/get_maintainer.pl
>> > <http://get_maintainer.pl>*, so probably didn't send the whole series =
to
>> > everyone.
>>
>> Usually I see the rest of the thread from the mailing list. I can't see:
>>
>>   In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
>>   References: <20200710104920.13550-1-frank.chang@sifive.com>
>>
>> on any of the qemu mailing lists.
>>
>> --
>> Alex Benn=C3=A9e
>>
>
> The rest of the patches are coming out:
> https://patchew.org/QEMU/20200710104920.13550-1-frank.chang@sifive.com/
> Not sure what caused the delay...

Ahh the mailing list is still chugging a bit it seems.

--=20
Alex Benn=C3=A9e

