Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6hJ8-00058s-MT
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 19:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6hJ6-00058N-LK; Wed, 29 Jun 2022 19:41:16 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6hJ4-0002Io-28; Wed, 29 Jun 2022 19:41:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id x8so12183689pgj.13;
 Wed, 29 Jun 2022 16:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aa1SrmRDMzKdUeUw7jPbWR8oelxZiYHE2cMIqqG4OW0=;
 b=QUWkhVX2UZWtE1mfGo6SfFbTos6nsFPHaCv/FrmG5IzEPnYcucDLiJJYx/5gg2GHqA
 QawBssbbZdtLsZDS6Xy1t5vXQ9G0J9clv+xCxMtWfZ1dTubXWyjwcsPpXSIlysda3jOd
 tDrpPEncvm3Fjv4vSFQEb1VTVL45HGyzjDBS3VtCpjHhzHmcNu+qZGr+PS6bJe2gwjfJ
 +qhHQzvCHLtyOL40xNfyANOY9sYpa9zXIXqHKprax/LUswO1Kav1ZcJHQlxc/6Zn9vsQ
 8jJlEb5wzafwol5lhG8LcgxBnna4OjTeXESnhfYE5HyGJdersUTvjtf9odjsxhBkC05E
 /oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aa1SrmRDMzKdUeUw7jPbWR8oelxZiYHE2cMIqqG4OW0=;
 b=79/GWu7pW7zw7HRwAJNOJ/MUPBh2O1LLyi9JvHofIHwhaZ4XEBghbsw1hjLMFBpbBH
 4HZgalB0lcaHVxkhMNGQFcOYkNwWw9M+rEP+6OOLpvO6ZrMdlr9+2X3Le/oNgmMnO+dj
 s32Rp5kncM1K2uU7TzKsl1N8GSh+uQcwCivZzxVSeW8ZLD0dFWMb4TYs6CjvatNYi7Zr
 KxeyiwCIP/1TmvnKM8B+hrcKv2X302bWXsgEvuVMen9ItDKCBnk1hZlyYytjkAIeJGhL
 fNltRhmKoDlMHVAam9E3FjHP/ag+I3I/f+GyM5hsh8w/xMaMXiqvSlFIHGrZJn8opAIF
 YAzA==
X-Gm-Message-State: AJIora8/9KTqKP+yNHdimWk7wid/w065xHydhKMcMviuzCpgk3W+vFAc
 t5yqe9aowNNDBbZMbnf4JkfKYvhzl7h0qm7l2NU=
X-Google-Smtp-Source: AGRyM1vkUGMd5f0Od1XUNB+rqSAfXmaJR4yv5kGq2DTAzQnl/ocGMm2qypkAWXVHy2m+fMohedYLSOeDByJv+42ue+8=
X-Received: by 2002:a05:6a00:1307:b0:50d:b02e:11df with SMTP id
 j7-20020a056a00130700b0050db02e11dfmr11510006pfu.4.1656546071558; Wed, 29 Jun
 2022 16:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220616031543.953776-1-apatel@ventanamicro.com>
 <20220616031543.953776-3-apatel@ventanamicro.com>
In-Reply-To: <20220616031543.953776-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Jun 2022 09:40:44 +1000
Message-ID: <CAKmqyKNUL4O+0bYjWSTXb5qDLTesVGUEW_hK=w3tLxe6Dqt_BQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Update default priority table for local
 interrupts
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 29 Jun 2022 23:41:16 -0000

On Thu, Jun 16, 2022 at 1:17 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The latest AIA draft v0.3.0 defines a relatively simpler scheme for
> default priority assignments where:
> 1) local interrupts 24 to 31 and 48 to 63 are reserved for custom use
>    and have implementation specific default priority.
> 2) remaining local interrupts 0 to 23 and 32 to 47 have a recommended
>    (not mandatory) priority assignments.
>
> We update the default priority table and hviprio mapping as-per above.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h   |   2 +-
>  target/riscv/cpu_helper.c | 134 ++++++++++++++++++--------------------
>  2 files changed, 66 insertions(+), 70 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 01608f86e5..63ba867379 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -773,7 +773,7 @@ typedef enum RISCVException {
>  #define IPRIO_IRQ_BITS                     8
>  #define IPRIO_MMAXIPRIO                    255
>  #define IPRIO_DEFAULT_UPPER                4
> -#define IPRIO_DEFAULT_MIDDLE               (IPRIO_DEFAULT_UPPER + 24)
> +#define IPRIO_DEFAULT_MIDDLE               (IPRIO_DEFAULT_UPPER + 12)
>  #define IPRIO_DEFAULT_M                    IPRIO_DEFAULT_MIDDLE
>  #define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_M + 3)
>  #define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_S + 3)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3c8ebecf84..063a1403db 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -169,17 +169,17 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>   * 14 "
>   * 15 "
>   * 16 "
> - * 18 Debug/trace interrupt
> - * 20 (Reserved interrupt)
> + * 17 "
> + * 18 "
> + * 19 "
> + * 20 "
> + * 21 "
>   * 22 "
> - * 24 "
> - * 26 "
> - * 28 "
> - * 30 (Reserved for standard reporting of bus or system errors)
> + * 23 "
>   */
>
>  static const int hviprio_index2irq[] = {
> -    0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
> +    0, 1, 4, 5, 8, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 };
>  static const int hviprio_index2rdzero[] = {
>      1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
>
> @@ -208,50 +208,60 @@ int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)
>   *  Default  |
>   *  Priority | Major Interrupt Numbers
>   * ----------------------------------------------------------------
> - *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
> - *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
> - *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
> - *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
> + *  Highest  | 47, 23, 46, 45, 22, 44,
> + *           | 43, 21, 42, 41, 20, 40
>   *           |
>   *           | 11 (0b),  3 (03),  7 (07)
>   *           |  9 (09),  1 (01),  5 (05)
>   *           | 12 (0c)
>   *           | 10 (0a),  2 (02),  6 (06)
>   *           |
> - *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
> - *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
> - *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
> - *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
> + *           | 39, 19, 38, 37, 18, 36,
> + *  Lowest   | 35, 17, 34, 33, 16, 32
>   * ----------------------------------------------------------------
>   */
>  static const uint8_t default_iprio[64] = {
> - [63] = IPRIO_DEFAULT_UPPER,
> - [62] = IPRIO_DEFAULT_UPPER + 1,
> - [31] = IPRIO_DEFAULT_UPPER + 2,
> - [30] = IPRIO_DEFAULT_UPPER + 3,
> - [61] = IPRIO_DEFAULT_UPPER + 4,
> - [60] = IPRIO_DEFAULT_UPPER + 5,
> -
> - [59] = IPRIO_DEFAULT_UPPER + 6,
> - [58] = IPRIO_DEFAULT_UPPER + 7,
> - [29] = IPRIO_DEFAULT_UPPER + 8,
> - [28] = IPRIO_DEFAULT_UPPER + 9,
> - [57] = IPRIO_DEFAULT_UPPER + 10,
> - [56] = IPRIO_DEFAULT_UPPER + 11,
> -
> - [55] = IPRIO_DEFAULT_UPPER + 12,
> - [54] = IPRIO_DEFAULT_UPPER + 13,
> - [27] = IPRIO_DEFAULT_UPPER + 14,
> - [26] = IPRIO_DEFAULT_UPPER + 15,
> - [53] = IPRIO_DEFAULT_UPPER + 16,
> - [52] = IPRIO_DEFAULT_UPPER + 17,
> -
> - [51] = IPRIO_DEFAULT_UPPER + 18,
> - [50] = IPRIO_DEFAULT_UPPER + 19,
> - [25] = IPRIO_DEFAULT_UPPER + 20,
> - [24] = IPRIO_DEFAULT_UPPER + 21,
> - [49] = IPRIO_DEFAULT_UPPER + 22,
> - [48] = IPRIO_DEFAULT_UPPER + 23,
> + /* Custom interrupts 48 to 63 */
> + [63] = IPRIO_MMAXIPRIO,
> + [62] = IPRIO_MMAXIPRIO,
> + [61] = IPRIO_MMAXIPRIO,
> + [60] = IPRIO_MMAXIPRIO,
> + [59] = IPRIO_MMAXIPRIO,
> + [58] = IPRIO_MMAXIPRIO,
> + [57] = IPRIO_MMAXIPRIO,
> + [56] = IPRIO_MMAXIPRIO,
> + [55] = IPRIO_MMAXIPRIO,
> + [54] = IPRIO_MMAXIPRIO,
> + [53] = IPRIO_MMAXIPRIO,
> + [52] = IPRIO_MMAXIPRIO,
> + [51] = IPRIO_MMAXIPRIO,
> + [50] = IPRIO_MMAXIPRIO,
> + [49] = IPRIO_MMAXIPRIO,
> + [48] = IPRIO_MMAXIPRIO,
> +
> + /* Custom interrupts 24 to 31 */
> + [31] = IPRIO_MMAXIPRIO,
> + [30] = IPRIO_MMAXIPRIO,
> + [29] = IPRIO_MMAXIPRIO,
> + [28] = IPRIO_MMAXIPRIO,
> + [27] = IPRIO_MMAXIPRIO,
> + [26] = IPRIO_MMAXIPRIO,
> + [25] = IPRIO_MMAXIPRIO,
> + [24] = IPRIO_MMAXIPRIO,
> +
> + [47] = IPRIO_DEFAULT_UPPER,
> + [23] = IPRIO_DEFAULT_UPPER + 1,
> + [46] = IPRIO_DEFAULT_UPPER + 2,
> + [45] = IPRIO_DEFAULT_UPPER + 3,
> + [22] = IPRIO_DEFAULT_UPPER + 4,
> + [44] = IPRIO_DEFAULT_UPPER + 5,
> +
> + [43] = IPRIO_DEFAULT_UPPER + 6,
> + [21] = IPRIO_DEFAULT_UPPER + 7,
> + [42] = IPRIO_DEFAULT_UPPER + 8,
> + [41] = IPRIO_DEFAULT_UPPER + 9,
> + [20] = IPRIO_DEFAULT_UPPER + 10,
> + [40] = IPRIO_DEFAULT_UPPER + 11,
>
>   [11] = IPRIO_DEFAULT_M,
>   [3]  = IPRIO_DEFAULT_M + 1,
> @@ -267,33 +277,19 @@ static const uint8_t default_iprio[64] = {
>   [2]  = IPRIO_DEFAULT_VS + 1,
>   [6]  = IPRIO_DEFAULT_VS + 2,
>
> - [47] = IPRIO_DEFAULT_LOWER,
> - [46] = IPRIO_DEFAULT_LOWER + 1,
> - [23] = IPRIO_DEFAULT_LOWER + 2,
> - [22] = IPRIO_DEFAULT_LOWER + 3,
> - [45] = IPRIO_DEFAULT_LOWER + 4,
> - [44] = IPRIO_DEFAULT_LOWER + 5,
> -
> - [43] = IPRIO_DEFAULT_LOWER + 6,
> - [42] = IPRIO_DEFAULT_LOWER + 7,
> - [21] = IPRIO_DEFAULT_LOWER + 8,
> - [20] = IPRIO_DEFAULT_LOWER + 9,
> - [41] = IPRIO_DEFAULT_LOWER + 10,
> - [40] = IPRIO_DEFAULT_LOWER + 11,
> -
> - [39] = IPRIO_DEFAULT_LOWER + 12,
> - [38] = IPRIO_DEFAULT_LOWER + 13,
> - [19] = IPRIO_DEFAULT_LOWER + 14,
> - [18] = IPRIO_DEFAULT_LOWER + 15,
> - [37] = IPRIO_DEFAULT_LOWER + 16,
> - [36] = IPRIO_DEFAULT_LOWER + 17,
> -
> - [35] = IPRIO_DEFAULT_LOWER + 18,
> - [34] = IPRIO_DEFAULT_LOWER + 19,
> - [17] = IPRIO_DEFAULT_LOWER + 20,
> - [16] = IPRIO_DEFAULT_LOWER + 21,
> - [33] = IPRIO_DEFAULT_LOWER + 22,
> - [32] = IPRIO_DEFAULT_LOWER + 23,
> + [39] = IPRIO_DEFAULT_LOWER,
> + [19] = IPRIO_DEFAULT_LOWER + 1,
> + [38] = IPRIO_DEFAULT_LOWER + 2,
> + [37] = IPRIO_DEFAULT_LOWER + 3,
> + [18] = IPRIO_DEFAULT_LOWER + 4,
> + [36] = IPRIO_DEFAULT_LOWER + 5,
> +
> + [35] = IPRIO_DEFAULT_LOWER + 6,
> + [17] = IPRIO_DEFAULT_LOWER + 7,
> + [34] = IPRIO_DEFAULT_LOWER + 8,
> + [33] = IPRIO_DEFAULT_LOWER + 9,
> + [16] = IPRIO_DEFAULT_LOWER + 10,
> + [32] = IPRIO_DEFAULT_LOWER + 11,
>  };
>
>  uint8_t riscv_cpu_default_priority(int irq)
> --
> 2.34.1
>
>

