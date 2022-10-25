Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on8q4-00012I-PS
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 21:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1on8q2-0000wj-6H; Mon, 24 Oct 2022 21:34:43 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1on8q0-0005QA-Rk; Mon, 24 Oct 2022 21:34:41 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a5so7240784qkl.6;
 Mon, 24 Oct 2022 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tkXw9un5TVo00OwOKoBKkJ/A1XBPVinN6ilfELdunTY=;
 b=Lm0DF3lT/E8qkWEF4TjTZQNVXMOjYqYj0Mvz2XqVRsfCwJTdKEHDlTkV78q5KYVKwh
 etdp+UiHhOLwZlQsa4rqxL4jQhOcNisag78Go5FWx/wZRcEgBzn/0g8V4PhPUE55MtPG
 Jv8vTIyoQ/HaRW/NrDDF5+6/rsLrc0xkbR8mAqHZ8/n9nHUhPefR0vSsPnyjrt708ddc
 +LexoXizHnYgvXooTfyP0rRqtGrWr81Z/qUEfencU5jW53Fasek9/WEIySaSkWoAfTnL
 4NacmtTajhbpxDXRGKdtWyAGLB6JnQHqu1gnIFNCa1duQMP02TkXnLqIwdGrhYfAVYiI
 DMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkXw9un5TVo00OwOKoBKkJ/A1XBPVinN6ilfELdunTY=;
 b=pX8IpaUInlF3LKcuSb7Y9xrjPcmjToCDfO26nnHQE903xQjXNgykrsf1QmwjJqdXJ+
 1jzBD/aD0Rj2VTFmEpViMOC4crE1g01wvERhacY8KMBLyNvf7rUp6OP5VtpVxzNQgqeo
 iirrhY3ObIB+d4y9zQvwJUo56UMG/1GWfPV6CoX0AuR2Ho/taQ5sqwtzpuBH9RROwIjZ
 MjXYmKWGnRmV0wHe0b84448Mg6esPH4dFqxv/dPRkLIXnB7+KU4i1ttsENdrZSlLrsJ0
 2n/HWTluo2qEEeUy56Y3pDr4z7T6Ckl38VHxoWccwH38eqrpNHrbin8CdevBO3wa14+W
 qjhg==
X-Gm-Message-State: ACrzQf3MOuIiIHyCHBtslXw6ZJ2Chuz+CvdB2cKxgLYA417Jp2jLkpHb
 MgA/Kj54sld/V22XeSrzuF2eWeZIU9WGxy/XUjs=
X-Google-Smtp-Source: AMsMyM4pc7atr6W8hI9P1oR9imKH5ZSRIPPqI+HbkRi0lqh/Kv+lZvsQN/6QKBo4cPc/m1Ocve2I0wYJ7TzdL8qEVsc=
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr25338863qkp.389.1666661679547; Mon, 24
 Oct 2022 18:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
 <20221025011040.246503-3-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221025011040.246503-3-wilfred.mallawa@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 25 Oct 2022 09:34:28 +0800
Message-ID: <CAEUhbmW1WL31bv+NLCegwzzhXmL8SHxMKNO0ANKufanT6tTV7A@mail.gmail.com>
Subject: Re: [PATCH v0 2/2] hw/riscv/opentitan: add aon_timer base unimpl
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 25 Oct 2022 01:34:43 -0000

On Tue, Oct 25, 2022 at 9:19 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Adds the updated `aon_timer` base as an unimplemented device. This is
> used by TockOS, patch ensures the guest doesn't hit load faults.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/riscv/opentitan.c         | 3 +++
>  include/hw/riscv/opentitan.h | 1 +
>  2 files changed, 4 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

