Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu8AV-0007xh-9Y
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 02:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8AS-0007xT-Lv; Fri, 18 Jun 2021 02:39:52 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8AQ-0001mP-Rq; Fri, 18 Jun 2021 02:39:52 -0400
Received: by mail-io1-xd36.google.com with SMTP id p66so5870807iod.8;
 Thu, 17 Jun 2021 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91f//BJ+imb4RfyCgObcNNMXAaUTaUFk05UVPirScU4=;
 b=fvRvfMoJW+OJBm6KTCKfrxkQ8ctH3comzUholBN5UJk2eeep9EGz991bDDwQ1N0jwf
 Y20HQDVTxe6H5C8cV7rydE3GfW7Y36Mrk6VqpeHM/1+qtsqrn6uh3+c6AlrZK4jiNx2+
 oUJxhK6Vm3Dh5mYo29PFHbR15SBljZhiQnJrqmM+CB05yfPq8I0hTp/bhoVNpJDSjQGH
 ZZJ76E45mwfKicRShcO1BjbeCSubOQbeKCxQcuemmvSselw5ne69TMnkdUI4hiDiHqUX
 iEdxJKqYYov6x6dcCbGEec2hwZAUkffBGvfa00ZU1VQD9YSJPpqSW1Zn/vKylE7SslKF
 YVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91f//BJ+imb4RfyCgObcNNMXAaUTaUFk05UVPirScU4=;
 b=L8TE3NVjpdVcGQn55C69tLJsTeVreNxWTtDS9EMLKX71eW3oSu4+H1tZTCREu2XUGG
 CX82vE6R2/yY6Uu1opZFOeiqwRBaREoFpO3KkFTJahiPLydrZuAS6GJDhQFFx6Dx7qjn
 78meygmyY/tKBFNC3FlGt+DkIA4x8s6OteUAVLpByU4Xc00KdiYtxWJ9uDC1Q1B/5L2Z
 R/XBxArRhp2xmdLMzizMmhEiWoqPW3+oNlTjiHkPpdEdHUamqmVkmhM/ciO1FPnWS8bG
 rR0SNplOtBWe2wttextddSl591dpt+NgfkJLJ0z/VmKiICijTkGyEK4+v4PLrNFF4mTq
 Q+jA==
X-Gm-Message-State: AOAM531SxNqTJh1WYQCstpVJI9ejRktlkfwGgn2SmEIgIkgrphA7Tx7q
 gvPBwdRQalWMIkEIUgsL2b7/iNAjaDsP5JLndhM=
X-Google-Smtp-Source: ABdhPJz4OL0Hkuia9nBVngElDkXzHTB+3OFcUQRMoh9Wp3sX9SvxMX1Ddp2bVS+81PNNvNYR0iKnJNYLhuX7luydMHU=
X-Received: by 2002:a05:6638:34e:: with SMTP id
 x14mr1956146jap.8.1623998389189; 
 Thu, 17 Jun 2021 23:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210615085133.389887-1-bmeng.cn@gmail.com>
In-Reply-To: <20210615085133.389887-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 16:39:22 +1000
Message-ID: <CAKmqyKMwK9yNywBcoFSEKxCdhaLw9-35mD_WDiJqh6bW+gwE2A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: gdbstub: Fix dynamic CSR XML generation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Fri, 18 Jun 2021 06:39:54 -0000

On Tue, Jun 15, 2021 at 6:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Since commit 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
> the CSR predicate() function was changed to return RISCV_EXCP_NONE
> instead of 0 for a valid CSR, but it forgot to update the dynamic
> CSR XML generation codes in gdbstub.
>
> Fixes: 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
> Reported-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Tested-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index ca78682cf4..a7a9c0b1fe 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -170,7 +170,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>
>      for (i = 0; i < CSR_TABLE_SIZE; i++) {
>          predicate = csr_ops[i].predicate;
> -        if (predicate && !predicate(env, i)) {
> +        if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
>              if (csr_ops[i].name) {
>                  g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
>              } else {
> --
> 2.25.1
>
>

