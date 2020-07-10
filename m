Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsQS-0001kN-1P
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtsQQ-0001ja-Df
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:46:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtsQO-0006rN-Qo
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:46:46 -0400
Received: by mail-wm1-x343.google.com with SMTP id f18so5793038wml.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=dlLqlXdtwhripTUgct/ZJP4rwsh+B45YhAdKamTdLFY=;
 b=gUTobrv8x3S3KEbwZJVyO0hMd3wVK53SmsDusx3W+7Ts5Z6oeUBorh803xg5jidpF8
 3nxWRl2vvJgHe15mSS14xndNVYy29z5zM48EoaM+OUF7a6e1ZbXyJyjMwZKOrOroUS6b
 L9AE0xzuRgxnKMfPNaMJqGt6k6TpMW3y8mymrEIUb48jeNdCHAcjyA5pr9E1QC/xj4Z2
 z+J3YEl08bbv70+HRXdsFhH48Rv3yk30gqIVHkJHNndrtiYBRWXm9csB8CthWZIQbaaG
 ZkYmTYbcSY8Vxus25RFxvY5LmxSTgcZMUBieWuCtsk8XoipdCkXUxkl8zIN+Mjrd/61U
 wkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=dlLqlXdtwhripTUgct/ZJP4rwsh+B45YhAdKamTdLFY=;
 b=Q1NzYfUPnZx67lTo7ce+mzRP7z58//RAnUeTG/wnD50G+9QRbWqn8y2Qr0ndxDuK+J
 3u3hSUofHdBqZhDSFj8I2w60oZMDHDDVZ5im+mUw2cjS6a8dUUHHUh57vs/C4utGsuM4
 CxvfEdRLlVJLT/NVidErjemgx27Wd4IkCu3s5mMtDaN6vs9zV0PLwvCQlCUB8yMNCrZp
 H/jBoe3+KrQN7hqtAtqrzbtTLteqRmo4/dTRBlDn+HlYpNnIs4TrvwpHcsvZp3z6i038
 gJ8EEQRW/S0g7+IB1EgUsycFWan1hkni2ffFFyUBERq8hCySXi5AmtTsHoxEiwTR0lhE
 6+ow==
X-Gm-Message-State: AOAM532ny1WYBcGQrvQ+0OGO1JTnLI/4z/gbMhzUpHTD3oOLg+2vINPa
 UVN1ufRAP6vDPIsMJ9TzhmvNGA==
X-Google-Smtp-Source: ABdhPJwkjd/F7+t3ieVj+oVIzkke8Srv4gtK32W+Qcy3woW54S5QQhfj3x6YSLwuAFtD6Wu6DX9wTQ==
X-Received: by 2002:a1c:9994:: with SMTP id b142mr4825236wme.141.1594385203532; 
 Fri, 10 Jul 2020 05:46:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a22sm9031655wmj.9.2020.07.10.05.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 05:46:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 552E11FF7E;
 Fri, 10 Jul 2020 13:46:38 +0100 (BST)
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-61-frank.chang@sifive.com>
 <87k0zblgjx.fsf@linaro.org>
 <CAE_xrPhKg1FeRwW0zS-jpfo8XL7WvSFywif27X0kAYgh044N6w@mail.gmail.com>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 60/65] softfloat: add fp16 and uint8/int8 interconvert
 functions
In-reply-to: <CAE_xrPhKg1FeRwW0zS-jpfo8XL7WvSFywif27X0kAYgh044N6w@mail.gmail.com>
Date: Fri, 10 Jul 2020 13:46:38 +0100
Message-ID: <878sfrleq9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 12:46:46 -0000


Frank Chang <frank.chang@sifive.com> writes:

> On Fri, Jul 10, 2020 at 8:07 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>>
>> frank.chang@sifive.com writes:
>>
>> > From: Frank Chang <frank.chang@sifive.com>
>> >
>> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>>
>> Did I miss the rest of the series somewhere?
>>
>> Otherwise this looks fine to me:
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> If you mean float16 to uint8 and int8 conversion functions, this commit =
is
> everything.
> I think I just cc the mail based on *scripts/get_maintainer.pl
> <http://get_maintainer.pl>*, so probably didn't send the whole series to
> everyone.

Usually I see the rest of the thread from the mailing list. I can't see:

  In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
  References: <20200710104920.13550-1-frank.chang@sifive.com>

on any of the qemu mailing lists.

--=20
Alex Benn=C3=A9e

