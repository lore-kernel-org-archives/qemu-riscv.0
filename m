Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDmuk-0002jP-6D
	for mharc-qemu-riscv@gnu.org; Thu, 03 Sep 2020 06:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDmui-0002gb-QY
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2020 06:56:20 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:44720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDmug-0004Vc-0j
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2020 06:56:20 -0400
Received: by mail-ed1-x542.google.com with SMTP id b12so2165184edz.11
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2020 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6pRNVMvnme2tZ0uXf+v/uXfW4AuapxJLUhEv6h7XN6I=;
 b=VDPqOQ5LWvGpqa00knJSzMiVF6NtoAWc9bslwfAcOHourNalQd2vQcmno3G5Tq15MG
 ak0DLGeKVMjseih9oo6l0Lwdn323aAq9KdBmgK0Sc2MUPi5zA0FoHLiQACbH4ZFATz47
 LE6GJbNEcFaBQ1Jlgvk1p7+w/3frXnquWnt/xGPhgY+Io/pYHuEm49OJkWzcMDZf5GdP
 PWh20axzgCJGuSN1pw//bHKxPOqVu/DNFFgChGoxMo4sg1hgpjqTk02Pgt8IZxxu3T+G
 Z2JOT2AhJFmk4CijYeaHHanelXEnYQqOBzKu8H43O5hAkdkKtA/Lq4HPP0kPdNAqLQWB
 oBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6pRNVMvnme2tZ0uXf+v/uXfW4AuapxJLUhEv6h7XN6I=;
 b=ZDtzkVeHXRLbBlJdJfS2An+JkZbB6Ei475HB9vZkDXnonulBKiGBiwnynTh89wQOuU
 omfshT33r8J+ktNkmdVzJxAUPi3Aj4B6BqUtVrUVJfbsgvVYbig8Dmz1K+E19FgZImii
 pgS8TXsv4GyFjjk4bVC1ktbh90o7o+/koYCE90ac4NhtZK0alOGLN7mqBuM6EJ8XjySD
 OKh+ZlXMXGORfdV1xkQLpTW0QfiLP4unq+p7S2eMhEwE6VufTMNF0P0Roxq6VAvl+tKj
 XaAb8X3zuNKP/V4GMJXcb2Ee3rPCfJLubvfDyXhHy4jm6WGe2IniPdv+3NBz7berQw8K
 YSzg==
X-Gm-Message-State: AOAM530RmkdECVMpRGDMdvvAyuj/O+Hy9SaWGo7o4vZDC66Uu5lPan0u
 R3cgpReNoA7QAzdfs2HklEEJ1fbohplqS+jqwotKmg==
X-Google-Smtp-Source: ABdhPJwWFklU8rm1hk/OG2XT4dtGpOv6oI5F29n/c1BcZzJiefh0r2j7AQVs1tT6swNdCSZqLDLXa96fj/AWmH202W8=
X-Received: by 2002:a50:e68a:: with SMTP id z10mr2513948edm.100.1599130576052; 
 Thu, 03 Sep 2020 03:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Sep 2020 11:56:04 +0100
Message-ID: <CAFEAcA9GjQ8Wr3QtPpobsFokQcgW-A2Qh1LrC-PErUgeafGN8g@mail.gmail.com>
Subject: Re: [PATCH 00/12] hw/riscv: Clean up the directory
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 03 Sep 2020 10:56:21 -0000

On Thu, 3 Sep 2020 at 11:42, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This is an effort to clean up the hw/riscv directory. Ideally it
> should only contain the RISC-V SoC / machine codes plus generic
> codes. Peripheral models for a specific SoC are moved to its
> corresponding hw/* subdirectories.

Ah, thanks for taking on this cleanup -- it's been something
that was unfortunately missed in code review for the initial
riscv work that we never got round to fixing later, so it's
nice to see things being moved into their proper places.

thanks
-- PMM

