Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lq8fF-0006VQ-Uh
	for mharc-qemu-riscv@gnu.org; Mon, 07 Jun 2021 02:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lq8fD-0006Rj-U3; Mon, 07 Jun 2021 02:23:07 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:38901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lq8fB-0004Ni-BN; Mon, 07 Jun 2021 02:23:07 -0400
Received: by mail-il1-x133.google.com with SMTP id d1so12058434ils.5;
 Sun, 06 Jun 2021 23:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pSuQyZE6w8KNKzEglFmn/3n4JnePYoDvMKkqs4ayHsA=;
 b=IeMkKaudnwNZ2z7BvoamsofhmhW37VSSvhp8oZMBkeTJwsdpS0wHQqV7OehAV8xTwa
 iyXV3OVmy1BxLaSExzuQfPmAwvFoAgWftVkQRxYJ0bH9IQsDIP9WsHL5XAVDOrXE/JDe
 3FqbsXqEUDsDWYqMtJ7JTFv3F4wZHOkV34yZGh6EHlrTtSd+0hEQeLEkcM75FYSsp1Na
 svbRdtE+p0AH7c11fK8xukRlTGNscJ4jHEHcN8GLZ//cyRY7cFk0EBp3oyxcdGh90Pos
 9cGpjg/AxV4Of74et85Vd3uxQebuuoVVqY6YTx+opv8AmowKltOY9aeAJCKHdkNdKilp
 BFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSuQyZE6w8KNKzEglFmn/3n4JnePYoDvMKkqs4ayHsA=;
 b=qNUZns4bo8Zr0fk3hfIJa/RneVHnhldcx57UzUlYXWhLuGOpJfpzQrpWbzwg3CutEk
 hoyVTXOBx0qdlyuMDCC1+pz79H7Kx1eCI+0gJB3yBUlnlMnf8lMPh9dekTgTrQT3W/iR
 pJANu+gcS9Saehm/83Sb+1plwVJ9e4+Dts3R6JL3FeCbD3GoOKsAVgFDDvcb6F2MSmym
 nfL73BOQWPhFTfgzc4k+tkA/HBqJb++1VZ1G9ErfvuFj5K9AcxKE7BrZCKzJxsgEHPyn
 hahtQXzV9AekwpPwdKW9e7oCsOtWjSmbFT3pJu7LIw8BPCZox4vsqvF1kbjXgrS/FXn8
 zoBg==
X-Gm-Message-State: AOAM533ia/e8KQlqEyGPdRd3tUfxKECm0ViaZ/DAVUmZIxzKT9XIg6rm
 omFYCysbBjutyJpqFj0ZNex99I7fOK+9lKV8MZs=
X-Google-Smtp-Source: ABdhPJw4wcCs7CBVU0EGaCRojbriZPqYFAHbiJ2s2PY4deIK82kmEMWcRl1U5zqP7omIfYUIyh2aDCkD+/Sg23BWo8I=
X-Received: by 2002:a05:6e02:2196:: with SMTP id
 j22mr936273ila.267.1623046983208; 
 Sun, 06 Jun 2021 23:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
In-Reply-To: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Jun 2021 16:22:37 +1000
Message-ID: <CAKmqyKNHX0p5OxE1Y+1bwUeQ1uXu_DTwTnYgK3xxB9tu9Ax_nA@mail.gmail.com>
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Mon, 07 Jun 2021 06:23:08 -0000

On Mon, Jun 7, 2021 at 1:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Hi Alistair,
>
> As I see,  we are moving  on to remove TARGET_RISCV64 macro.
>
> I have some questions:
>
> 1) Which tcg op should use when translate an instruction for 32bit cpu.
> The tcg_*_i64, tcg_*_i32 or tcg_*_tl?
> I see some API such as gen_get_gpr that are using the tcg_*_tl. But I am
> not sure if it is
> right for 32bit cpu.

Do you mean for an instruction that only runs on a 32-bit CPU (and not RV64)?

If the instruction only supports a 32-bit value then tcg_*_i32
otherwise tcg_*_tl is probably the best bet.

>
> 2) Do we should have a sign-extend 64 bit register(bit 31 as the sign
> bit)  for 32 bit cpu?

I'm not clear what you mean. Can you point to a spec that you are
trying to implement?

Alistair

>
> Best Regards,
> Zhiwei
>
>

