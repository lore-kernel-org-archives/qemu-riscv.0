Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF8ACAC5B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:25:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v31h7-0002hm-ML; Sun, 28 Sep 2025 20:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31h4-0002hd-7s
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:24:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31gu-0004Al-0D
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:24:40 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63163a6556bso9076251a12.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759105462; x=1759710262; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0PKdVb7dD3GoNt2SJn3gMoSqWUs/dv8Br1Qvpa3/P8=;
 b=afUxizvsV9um+D0mTVIJ89tlD5EEgxKRC7DaBsdc/7xexSbT/+BP37zi7ftaqTduCo
 jDjKF4ysQEq/SYJVl4sdLNKYuCSaj00mE091BTsfTG6nJd7i2+OE7li8CE8GqlhGdtHk
 RzZFDXq+bdwez2JhWW/GXf4wPqCl6DPiVKuzwlb8k1008rpvVJC4ipQ4Gcag4j4q+TyL
 whJ/pkvW5bYN3S7HJeWYoCLYU/ExJXBqUgnWD8p1tdCme3cqqs+Bx4OgJSgBiizX6lBv
 wbaPbdohgm5o+Gaz71tsPOoGiHQ93s3R8vcufCEPx60HKbXDThZ0mlIR1t/Q8dyA88Pj
 IwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759105462; x=1759710262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0PKdVb7dD3GoNt2SJn3gMoSqWUs/dv8Br1Qvpa3/P8=;
 b=HpdG6d4qNNnZaWBb5vaUhKg1vSpY+1eAKQ5en+ywTL22aHndbVcuQ+RZvhIlaIR0H5
 oaSL16cxZmXbHWM2KmhK1FlHKPFlZUZQMgtWI/sCZP9lqA+Ao/hYe7YXyI494+tjHFpX
 T1/n0P3ytIbz+iVkiZ58M+Luh177q4BSEZJmbZgcPvV45nzdwjunt8EPV/n4f3LrjHCB
 zIADe9ZDxpf8Y2lxm7Ig5aZ2iWZ+2TU/lYWQeQSzVjQZgGH8VrITEBv2tTS8BRSGdZI4
 QQ3BrTGI7pG09X1QL65+cInFTF7Vw8D/wNpBvhRO4HdsaVGmtuXNDCT7ac2hmv7YOSmW
 f2Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWue7Je1YUBehss9VBrvVCjVlBjWPfUZH0YDanWHEEvFPoSYQc3tkEYmqaNwr5GtFxMzKKYd2jvNQlb@nongnu.org
X-Gm-Message-State: AOJu0Yxs3RU7fr+288y62o/k0v13uXsHi2a1RY5L5Gl33BXyjx+Powvm
 aNw09nM+aNuYYwnKe5VOP2kb7RYmPvZpnONZVsLFle0qM2PAcn+L6i1gTHIUIkAP1F1rs9loSeu
 dqsdHIKgxeUqoD6FzaIPtpwO0Lx8kCCw=
X-Gm-Gg: ASbGncuciz5I7nkw8kITHwZLAyP3ARHAIvfXhXQ2HVSM9VmVVIMgAHCV1tmqWNPvLqY
 9cDR7nBBK0TYF2hhPUAixZsF2RxTE3ZsBa69T+kilf1Ea8R9+4k5Ala2N4Fq0/uBRI0M7BQecJW
 7THlEuBSCHnjhYxD5Ypa/Hk2KuOZ8GW1ilsqReL2qlL+u0HwOF+N+IK9t91ZHrXIvmhHfuvesHb
 XtdgcSStJu6/6uT5TEuSB0ofZeJYTGz24NYyGxR2qTTR6/q
X-Google-Smtp-Source: AGHT+IGr6rpV3HVru5GCXCUkeQ3hAq/MRG/AivzYegdtBzBg6TEXPfTxtAag62iIOqs4jlrKf6FtkncZ6lJun4cQ9FI=
X-Received: by 2002:a17:907:608c:b0:b3c:4ebc:85dc with SMTP id
 a640c23a62f3a-b3c4ecbd1b1mr417961766b.11.1759105461784; Sun, 28 Sep 2025
 17:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250827203617.79947-1-stove@rivosinc.com>
In-Reply-To: <20250827203617.79947-1-stove@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:23:54 +1000
X-Gm-Features: AS18NWA10AlcIPmft_-qAeb3W0Ra0lAsR6M08W6cTkfSuIDShIM-N6HZndkKRNs
Message-ID: <CAKmqyKPXL+TcaccFKt-w2ZwQfuo24fiEEYvUDb8cmxwpNeAHtw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: use riscv_csrr in riscv_csr_read
To: stove <stove@rivosinc.com>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Aug 28, 2025 at 6:37=E2=80=AFAM stove <stove@rivosinc.com> wrote:
>
> Commit 38c83e8d3a33 ("target/riscv: raise an exception when CSRRS/CSRRC
> writes a read-only CSR") changed the behavior of riscv_csrrw, which
> would formerly be treated as read-only if the write mask were set to 0.
>
> Fixes an exception being raised when accessing read-only vector CSRs
> like vtype.
>
> Fixes: 38c83e8d3a33 ("target/riscv: raise an exception when CSRRS/CSRRC w=
rites a read-only CSR")
>
> Signed-off-by: stove <stove@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4a862da615..dca8edff6d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -873,7 +873,7 @@ static inline void riscv_csr_write(CPURISCVState *env=
, int csrno,
>  static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
>  {
>      target_ulong val =3D 0;
> -    riscv_csrrw(env, csrno, &val, 0, 0, 0);
> +    riscv_csrr(env, csrno, &val);
>      return val;
>  }
>
> --
> 2.50.1
>
>

