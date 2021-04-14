Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWaRK-0000IE-JE
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 03:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRJ-0000I3-Oe; Wed, 14 Apr 2021 03:59:57 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRI-0001ku-8m; Wed, 14 Apr 2021 03:59:57 -0400
Received: by mail-yb1-xb36.google.com with SMTP id x76so11148033ybe.5;
 Wed, 14 Apr 2021 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y7L1UbA9+tTOkPlDsjY5PbkoqsSfv32GgHvwSlXGJ5E=;
 b=g4MwZ8jmAoy4vZI/gvcEd5iWKsNnYlmOzwnZbW7ChHdmrnJcL/OEc4J+2+oAbXQoxR
 Z0PJjaEsKGqwGYxZvFvFCRuBxR+oHSiDAzmD9JwY3WrklGZLoSLrBNxYnRxjViwsV5EF
 v6gINaavUOQ69qO7lJRYrvTkXKuf+9slTvDiWPzwnot4HeRqu26raW7PKSJiwcNVvRRG
 YOTrpIXlNMi9Tgy+ut3jm9/I56CrXcivRZZzM9SgFyPW8Kid/OulOz/D+vGnt5MvfWHp
 d0wuHnSfZf90w4pOnafImaPNY+PuuWSFZWDAhaYBkWVrtw4/KvFBiLriyMMr+Fk++BK5
 s2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7L1UbA9+tTOkPlDsjY5PbkoqsSfv32GgHvwSlXGJ5E=;
 b=nyV+krrmh9Gqew5yJWpH60wZ/ujJLHESuN5DtnTUFMppHOaMT+t5RKPblsYYOTfv2b
 DajtYmXuZyOAlSdpOLQSq9jN3og6rFECkh7t/7vmvEq2HrmRZv5B3u3AC5iC+U8vlfIm
 UeYDsF7aNJxcRaiFgmdG47f3NTzRpINKLBwqNwRx2U1gJfbn7UuElDmT12nn1jnZ6Rwb
 OxJJah97Zp8UAtPh3CIqvTSTiEW7FLcw0Szu/GW8u9Tplcganlvky8ffPCbjsUfrENJ5
 FoZQ2dcwTmPhJhNxfpklfM8ABhsZIaeN987SfKDNiGtSpvGe3H6MfIlVF6Wja+k06uC6
 CSYg==
X-Gm-Message-State: AOAM530COUm+bnvxC2jcoTjsVhgCU18Py+jA43RQWFNNgTnXWYEH20lx
 LDCb7Yk1e7T/r6Ag2JfFtp6bS04LFlbZ3zbZB0A=
X-Google-Smtp-Source: ABdhPJxs21xuPii607ID1bFL5EDEykHCFgt5MgrhLWf3tq3uVrJ9fKhgDzexL1a7XuTd3oDpB4MRZezqGk7jgf9yVcA=
X-Received: by 2002:a25:cf8f:: with SMTP id
 f137mr16164279ybg.122.1618387194878; 
 Wed, 14 Apr 2021 00:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <3eea7ff02e990d9d9cb906be9eb821eaf1ee5408.1618356725.git.alistair.francis@wdc.com>
In-Reply-To: <3eea7ff02e990d9d9cb906be9eb821eaf1ee5408.1618356725.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 15:59:43 +0800
Message-ID: <CAEUhbmWpc0FZ3W6iPeMWpDVJn3b+8gt-2FUtuaD=oYUvixRtDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] target/riscv: Remove the hardcoded RVXLEN macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 14 Apr 2021 07:59:58 -0000

On Wed, Apr 14, 2021 at 7:33 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.h | 6 ------
>  target/riscv/cpu.c | 6 +++++-
>  2 files changed, 5 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

