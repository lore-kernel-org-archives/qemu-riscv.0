Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jts7J-0006xs-4F
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jts7H-0006vK-D2
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:26:59 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jts7F-0003MH-NR
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:26:59 -0400
Received: by mail-wr1-x443.google.com with SMTP id k6so5767502wrn.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=lZT61Offf3DWMlUhHXIHcDEA7gzMQqsih81rXDTrMMk=;
 b=OEl+Av+L88VsPrclIRaPEyadNDgbMvPxh27/TDZrQMTicYCesMdz5/3T4KCWl+QfWI
 vv0Kfv/UaDkvnKeg0FSEhSI4wRUIq4dmCoeo5zE1ZmhnhnYIbMaORJaouuH6eFAlfehU
 ATlHW02/15lDaJkp53viklZitekSaVaF5i7yWO5hPdBD/RExQCNP9hQDD71redJBNghY
 1Wh6xUsDkyLzKr4r0r1+jb5+TnlyUY69HV5++v6V7+frlGegvwklXxEq3cpY+xuRRpFn
 w82BTLpRQwuhoJhDTGLVtSRhAwUuhZihAqhMg3knWSTUv7Qk+LV7vK5ru48W7M+Q+/fK
 s13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=lZT61Offf3DWMlUhHXIHcDEA7gzMQqsih81rXDTrMMk=;
 b=GmrjZHgML2qM1bruxyCo6yIUDvNimtnma3LTu8neZguU4jeTU1F10ToyMLSNKCueRB
 Xmb0fomTMVIgh0wb2fKgBSD1VDD53703S8qBqdrGT035z2ch6x1pXVdBO1MAEVhqA5Cm
 xXhNpibgaVxVfZozht3LWxscCZmyVJ2uPJYEUcN+/VvbT8P45K87rv1cLNQ35Pygp7kC
 /4ZG6SwV5MWkaR6jrQLengHLscz8AxoU5jHME7oi5/U+HXODGoQlZ66V4bEZ+0KqQbdJ
 2gpLWB9bmKUCOnKtQ381CrOJi6WWzoyvSFFQSmm2XL9Px0gEYYSd5JTWXEwVh4GdOMCH
 ADEw==
X-Gm-Message-State: AOAM531rvNE0B6y0XQKzYIp4N9T9VSHLGscV63r548/6RDIjTiD7tOXJ
 d+zH7jCsWMOG+6i+EFZuwkzlEA==
X-Google-Smtp-Source: ABdhPJyhwZkbH4E07QIPumHS5ZRO6KX3VuDaCTInXqU5Nia28NdAMYutfBr3jEj5eCSDR/zGG6eEdg==
X-Received: by 2002:adf:e884:: with SMTP id d4mr65190280wrm.176.1594384015840; 
 Fri, 10 Jul 2020 05:26:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d18sm10536939wrj.8.2020.07.10.05.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 05:26:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37C511FF7E;
 Fri, 10 Jul 2020 13:26:54 +0100 (BST)
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-64-frank.chang@sifive.com>
 <87eepjlfri.fsf@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Kito Cheng
 <kito.cheng@sifive.com>, Chih-Min Chao <chihmin.chao@sifive.com>, "Aurelien
 Jarno" <aurelien@aurel32.net>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 63/65] fpu: implement full set compare for fp16
In-reply-to: <87eepjlfri.fsf@linaro.org>
Date: Fri, 10 Jul 2020 13:26:54 +0100
Message-ID: <87blknlfn5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jul 2020 12:26:59 -0000


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> frank.chang@sifive.com writes:
>
>> From: Kito Cheng <kito.cheng@sifive.com>
>>
>> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
>> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
>
> NACK I'm afraid. What's wrong with the exiting float_compare support?
>
> Even if you did want to bring in aliases for these functions within
> softfloat itself the correct way would be to use the decomposed
> float_compare support for a bunch of stubs and not restore the old style
> error prone bit masking code.

In fact see the example float32_eq inline function in the softfloat.h heade=
r.

--=20
Alex Benn=C3=A9e

