Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjvIr-0006iN-Bn
	for mharc-qemu-riscv@gnu.org; Mon, 30 Nov 2020 21:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjvIp-0006gh-2v; Mon, 30 Nov 2020 21:22:03 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:44958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjvIn-0002Do-E7; Mon, 30 Nov 2020 21:22:02 -0500
Received: by mail-io1-xd43.google.com with SMTP id z5so68379iob.11;
 Mon, 30 Nov 2020 18:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rGbLsEdi2R+UiZrVOPjH3eDKw5FeTdINDqXk+4b9J58=;
 b=bLDW2vQApu73zv7cwk0EpdDIfD62Hi1YPfZ0Zc2Jqm0sluISozTtWtLBsjRj0Wshrd
 5o10H8fzQ4l70iv//LUaCncci2xGb6O/5dCVTjveiJN6YTyPsy27oG/0Rl5tMWm25N16
 PUYWX7OS1rogcaapAXsWfQVDMuAllKOMKdqdqhj8aYYg/6yxCkEV+jvPyBp1g4w8aumc
 OSduVjBbnPwfx7AGIHsdE3304vnedZNz+bjHzSTKDzfU/5wP8H12StF1Qv+/o8uEcJQW
 g3BZFmcXlubW6jW91FCgkn5ZFEs/ZWLXhfiD57AKnDvxaqLPlIWnmoBJuu4H8qq2b0L2
 L9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rGbLsEdi2R+UiZrVOPjH3eDKw5FeTdINDqXk+4b9J58=;
 b=E66MFWzv3Mb24ddWOcOIt5ubsmgiHXqwGGh/YTaobj2rLWMBGlYEu7f7cRljFh3YHr
 kf0QxRr17zuVUjjOR1nUVkzbfDpMnAF0TSID+tF1lKJecbhn7ZUNujtOHcOF1dlmFcE4
 2iisy/y+9YpZybwod1349I2U0o7XW5Y0OOl3DM3uFdOz4ZClOBK0q5p5jt6ZUBCbgLSY
 Z7abm6NhA9z6yAcBmyqsyJS7+KqomirCVdkqLEbWXPktVbXqbPt9/CzbH2Fwbg7TJYGu
 VfgF4DybdhfZeFmL9mcqg/GSDUoCbkaViVNMI/bkwJKyknpNIBEjghzgT3/9YXDJLXlY
 gSyA==
X-Gm-Message-State: AOAM5320B8fb7U1ZX0IVTpGsGc0nya3zq/fuP3eleivnnyc3D0upsMxq
 YI5AaYs/hdXXd3zUsTykj5KHYkzNXpo7VSfXKsM=
X-Google-Smtp-Source: ABdhPJy61t+ySj22zo/e9iY2/YeMOZ8O+tH6kWr8DT3HEv+/ENf4qy3NJYxlRipJHRS37Wu4HW1Yk7eTc6WyspyHD5U=
X-Received: by 2002:a02:6c09:: with SMTP id w9mr696980jab.135.1606789320348;
 Mon, 30 Nov 2020 18:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20201130170117.71281-1-Alexander.Richardson@cl.cam.ac.uk>
In-Reply-To: <20201130170117.71281-1-Alexander.Richardson@cl.cam.ac.uk>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 18:09:40 -0800
Message-ID: <CAKmqyKMD3c5dD8-V9kfYS5aizE1fm3N+ot37kPgyb10km7gmsA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix definition of MSTATUS_TW and MSTATUS_TSR
To: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
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
X-List-Received-Date: Tue, 01 Dec 2020 02:22:03 -0000

On Mon, Nov 30, 2020 at 9:07 AM Alex Richardson
<Alexander.Richardson@cl.cam.ac.uk> wrote:
>
> The TW and TSR fields should be bits 21 and 22 and not 30/29.
> This was found while comparing QEMU behaviour against the sail formal
> model (https://github.com/rems-project/sail-riscv/).
>
> Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 24b24c69c5..92147332c6 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -379,8 +379,8 @@
>  #define MSTATUS_MXR         0x00080000
>  #define MSTATUS_VM          0x1F000000 /* until: priv-1.9.1 */
>  #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
> -#define MSTATUS_TW          0x20000000 /* since: priv-1.10 */
> -#define MSTATUS_TSR         0x40000000 /* since: priv-1.10 */
> +#define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
> +#define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
>  #define MSTATUS_GVA         0x4000000000ULL
>  #define MSTATUS_MPV         0x8000000000ULL
>
> --
> 2.29.2
>
>

