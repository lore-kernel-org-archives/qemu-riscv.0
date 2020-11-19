Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfpGZ-0002LY-Ss
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 14:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kfpGX-0002I1-OL; Thu, 19 Nov 2020 14:06:45 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:33417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kfpGW-0000vx-08; Thu, 19 Nov 2020 14:06:45 -0500
Received: by mail-il1-x130.google.com with SMTP id y9so6375731ilb.0;
 Thu, 19 Nov 2020 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5oLmtYiRH6NV6kROXu93cf6redqaxmI04ejhC28b4qA=;
 b=V6YZLdxIiIHumOyjmfOGXHZpqCRR+PgU1uooouU7liJql5ujKH1W0SjkVUsagub1aJ
 toEqIEPxXr6D8/ltJqQDfUc/Coz6bBep4XQkx+N2qEIzu3jyOxfvaW3exwIeDcUh8kEx
 VWMWpQPDB6xXHirUA6fu8ubx3xqukZ/neRlYnW+ga24Z3qJTyTxEs4eFbyGaDqL0bMwe
 t7Q2YxF38egXrLSVkucYIaEv4q2zCLEc5hhSPt1oDMHPlRrOsVZz+AxXoGEPCj3GjW8X
 AXgEgFc43uBd44moq3LICfPzOUpb9gFlQ4XNjqg471P0yoW5DmYkkDbq6dBpQ/MaYNhx
 K6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oLmtYiRH6NV6kROXu93cf6redqaxmI04ejhC28b4qA=;
 b=JRLhPDLO7yaT9NhnoqdvpTAMvOZOobZGCc1YBDk8vhXdn8jq0BxcFsp1JzeAeu3txn
 RgJ5uDlj+Y02kkCtzZzeb3Z/VsRjzQrGOiKS6o5aeRL9D/cGGqQnvZXbphUKHpuIfkFA
 ePo0kZyhnLxmW+q7O2/AckoKSYemSF5vZ3V1NNTWhcTuQensAbkjZjJYHqM0kxSATdlB
 pTWXK2W4INGsvbkN1fvKOJKR8HJ5OrCRdU0MCCPbvC+ZbnP4YreMvw3+NqlO1lDuyST7
 1oASDJnLHvS67mD9Rozhdd7C0CwxPA15jdVfu83QrC9L0vKgCKUrgBfNnGqhKEHhUMhH
 rldQ==
X-Gm-Message-State: AOAM530OYhGYABcNFfdYB8N94vfh5ChF86GVkol2MGwvgCyFYr/Ljr2h
 IbHnJvarlIs8Hj4WyEpTpFrJ1CeYzVbxZB8l6f4=
X-Google-Smtp-Source: ABdhPJwcpFwFJzCvB52q0utYFbdL6UKWYZloHskZEnk+fvrNJAXEuhck7cSBV2xvpGsBnyenav5ZluIonyE4Kx5RLWE=
X-Received: by 2002:a92:5eda:: with SMTP id f87mr23846496ilg.131.1605812802189; 
 Thu, 19 Nov 2020 11:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-16-frank.chang@sifive.com>
In-Reply-To: <20201118083044.13992-16-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Nov 2020 10:54:18 -0800
Message-ID: <CAKmqyKMQN-Bpfg8v358S+LHSN17PvVYDZoXiWzrUk_yRAGGs0w@mail.gmail.com>
Subject: Re: [RFC 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 19:06:46 -0000

On Wed, Nov 18, 2020 at 12:45 AM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> B-extension is default off, use cpu rv32 or rv64 with x-b=true to
> enable B-extension.
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 4 ++++
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0bbfd7f4574..bc29e118c6d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_h) {
>              target_misa |= RVH;
>          }
> +        if (cpu->cfg.ext_b) {
> +            target_misa |= RVB;
> +        }
>          if (cpu->cfg.ext_v) {
>              target_misa |= RVV;
>              if (!is_power_of_2(cpu->cfg.vlen)) {
> @@ -515,6 +518,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      /* This is experimental so mark with 'x-' */
> +    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, true),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de4705bb578..c1c77c58a87 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -66,6 +66,7 @@
>  #define RVS RV('S')
>  #define RVU RV('U')
>  #define RVH RV('H')
> +#define RVB RV('B')
>
>  /* S extension denotes that Supervisor mode exists, however it is possible
>     to have a core that support S mode but does not have an MMU and there
> @@ -278,6 +279,7 @@ struct RISCVCPU {
>          bool ext_f;
>          bool ext_d;
>          bool ext_c;
> +        bool ext_b;
>          bool ext_s;
>          bool ext_u;
>          bool ext_h;
> --
> 2.17.1
>
>

