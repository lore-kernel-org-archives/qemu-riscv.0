Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhNtM-0003Gb-MO
	for mharc-qemu-riscv@gnu.org; Thu, 13 May 2021 22:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNtK-0003Fo-U3; Thu, 13 May 2021 22:49:30 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNtJ-0001Sw-BM; Thu, 13 May 2021 22:49:30 -0400
Received: by mail-yb1-xb33.google.com with SMTP id c14so5603706ybr.5;
 Thu, 13 May 2021 19:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d1HYa7tJOEcAk73H+3N8qAqcwVI3VS3gJzAfwNCNSv8=;
 b=l5kcsExRnNV32pUkEpQUM+icL6aWobnZ481cQXk0EyBkIRVk432gsrKo2L1Y/iR9Ob
 szImNCetAHNTszjPggpVmLiATKPuss9fBS13/shavAp7e102W4OVCQROKikhUWEugDwB
 YFtt9+X91TDJFYiAPc5whS60TEx9AtIYnoNmHvr3BdLg3JPFPLACXSCeijSnzskdhW6F
 JaZdpUkX1BMLGK5V0DWTdB1wj6TmrjITe6OHddR4i7BCcXmV11sbPUOTXBnTsRMxcc6K
 sdL9VK0z9cFtcvcNeHHKC83lqrVcbOZyiXZHcgZV6m5hpgAN1cYEyvfz9M4mSM9d7A8t
 TofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d1HYa7tJOEcAk73H+3N8qAqcwVI3VS3gJzAfwNCNSv8=;
 b=HGw5P0HpwXNfa1HAkMLwTKR+UhmdeNAdxSnLdNKNHrl51cHh4P+W5fijxdMhuCYpgC
 XXrQ1wtRiuE4BBDJgMj6/lmmsoD453IQEh7PRimiDtEIM/FERBDj6xhOC+4AnGJMnD8N
 bp14fheTGTt6YiBrqbb8AlKZZCBhVtmUY17Y9TRfUdt3hOLGcMdzj9MwlsFsChzbG9UL
 vpfZyGGdnAq4Ez4NrTGDPKHpD6/ly365JB8qtqTeYooCWZKtMX4h5qydJNF3NaeGtJ49
 9KJSRBjuYUTdhajlxJZngPIV+Xj7Vot0zfkVymJ5Nw3FLZq4st0VZlGS/IfHxollekL9
 Jo9A==
X-Gm-Message-State: AOAM533fE9NyewftnzZL2wvb2S4JbTcEtUaCfT1X13Fc3e2sYQE37t3I
 KLkqstgaYnIsZO8v7r+LdCy777UGO0P6ue3GXSo=
X-Google-Smtp-Source: ABdhPJzR5M3sZZqxKO1eZpjam/Ax7X9e7pPMbrlREmaPW2RrVoc1dV7EsWBr9yVJnz38u8vVLz/fAABUIIoCoJcNWwE=
X-Received: by 2002:a25:d990:: with SMTP id
 q138mr65696784ybg.387.1620960568117; 
 Thu, 13 May 2021 19:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-8-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-8-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:49:15 +0800
Message-ID: <CAEUhbmUeqPT5TO-hGMBVqhnc5i6CYY5BUvLcFPc+7ZRkJSy+EQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike
 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Fri, 14 May 2021 02:49:31 -0000

On Fri, May 14, 2021 at 12:58 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
> symbol and only have these machines select it. Adapt the Meson file
> to only built it if required.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/riscv/Kconfig     | 5 +++++
>  hw/riscv/meson.build | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

