Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhiJO-0003ar-1y
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 21:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhiJM-0003Zw-Df; Thu, 21 Apr 2022 21:42:16 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhiJK-0005nY-TN; Thu, 21 Apr 2022 21:42:16 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ec04a2ebadso70736987b3.12; 
 Thu, 21 Apr 2022 18:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v98z6uWasbWHogvt2vc9jHeOjRUlSaT87EkCSRoK3i4=;
 b=T89bEjEgmpCkx06e2NfkmAO9GlexPQ5CWoWCtAVLOi7zepnfu4Ay3HuiSTVWac2ZHa
 UCgRKhizTUY6wpWhwoWjKtwc3t4iJfhUJMO1TtQQGZINd6dhwPmDMfPJ/WkR4RFvsnSN
 h+omQEKTUSYyM9NSp2IZ1NlRqujoRw9EiSQkGkwLjzzeDFgYM6dbgOM8KaPrJllDGiWj
 vi+J6wQDrbNb9i3l3jG5WyV2fbnwDP7KQ3eUgu8MVgKjfXJnIwG19IfPEZCaasurneMC
 q1jrtmyfesJKKAdhOqw74BtFM1S7v6Dmxg4A9GSmR7lCwPMM/P7yZWdMpZiJuNdFH4HM
 MW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v98z6uWasbWHogvt2vc9jHeOjRUlSaT87EkCSRoK3i4=;
 b=xBDYvNAicUCilemSeruiekZOYSZJCAHG+s8mIzZ6kotfq4emeGOq0fDt7PdPSFkyPd
 b9po6lPqyfL/EnR+/YKWWdZxyKBf4EBm/W3TxgQXHJs395WJ0q8iSsAV+1Oua8FASOSl
 UievHSOrGVBs5bPBmfkNXrjncLYrIdZ3+/YP6O9eoLwAsZrfO3wwyySkotx3XXRatYNI
 6fm42+jhfKqnUkB+DLf9Iq+DMh1XmDsDZmTZPbgwbbXoadKsNZvDZkE/hd5kICT/CKtR
 VOlvohFEVYnX5domYWGv4MTwnxOBXKqdWaXbd/BwXHzRqdKh2OUSGBJlMVNOOAHyuJQ3
 DL4Q==
X-Gm-Message-State: AOAM531zC2W/DqtbWerQKC1YdV0PX3pI/3VoHKtgbGgOGDaKrUxvEA2+
 viL1fVmATdf9bMZ8e4lRiNIjgg3YmxlDUM16fic=
X-Google-Smtp-Source: ABdhPJytDWrCOcwaBXSLFfBxvb7AmBGSwjex3zjhPcJnQdwG7GF9CkHgBbulWc2TFJO7U7m+v55PDL49XaJgze62zFw=
X-Received: by 2002:a81:1bc3:0:b0:2e3:aa1:f553 with SMTP id
 b186-20020a811bc3000000b002e30aa1f553mr2566878ywb.491.1650591733479; Thu, 21
 Apr 2022 18:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-4-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-4-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 09:42:02 +0800
Message-ID: <CAEUhbmU3mJtWk8uST=YBHvvPkHLRmUedP6TKiaZoTayvQV=yEw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] hw/riscv: virt: Create a platform bus
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 01:42:16 -0000

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Create a platform bus to allow dynamic devices to be connected. This is
> based on the ARM implementation.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  include/hw/riscv/virt.h |  7 ++++-
>  hw/riscv/virt.c         | 68 +++++++++++++++++++++++++++++------------
>  hw/riscv/Kconfig        |  1 +
>  3 files changed, 56 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

