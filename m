Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWWPo-0006Ur-O6
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 23:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lWWPm-0006S3-GA
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 23:42:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lWWPk-0005xt-RM
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 23:42:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so11759058pji.5
 for <qemu-riscv@nongnu.org>; Tue, 13 Apr 2021 20:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=m4QaEvX13+YjQd3jg7kJvUNIvda2k5QLmlTdOfaWvaw=;
 b=BfBlyNLOTZxWQRORUBkOkZv4DvBWaYEk09dZ9i/VHhnZtC561swx6BtGzfdm8zbCRz
 bOQMKa3UVFpeAf9cWL8KigQ2/CUtlAgH74+HKMGA/CjNSgYeZkL8vAWFNmGYEpUOzepO
 L6sLAuqhcosHeIrPODL9V6KbEJRBThnO/twDTEjhBtI6Ayo+2fuOgAAiW/v54/I3Ss8R
 AERS3LVKaDAr+EodVc/O9h7nN+gY9mIPxiuss9G+f6DW4ot6V95PqBoexxO3uNzQGYVQ
 1rU0e9s5XIgMrd+jsHWkMyxnNPGqWz3tChX+BRean9HBf1Gufpy+MjAGq30MOcEBG4Sk
 sbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=m4QaEvX13+YjQd3jg7kJvUNIvda2k5QLmlTdOfaWvaw=;
 b=K56xUIYp+KzfcLOESJ6OpiFr7APtbsPrdlK3mHvuqzSMooaJWFZMjq7CeURRusNU7y
 5hQbvPTuUSc5OdgpkslILhrEhNYYC8QVitHuwy9BA/lo83cfcOAtXsEww/TXltF8uihe
 MJHwPkF/BYYCIbdmDPVAT0DSh55y7XLyDQJUL662TTeENGDbG2250Uo9RToNUpTH5OLv
 HiDy4GjKK12HjpIMl7jt8PqwJKhRFJjA2rb4Boef/zj+4XUQdqbpzrgRlaCPk27SAdY9
 lF+92NPSuw7HUUBtHyzCC2x+f9fGuolsEDdKtpZKLyj98oW063qBpSsxOTzFWjHvhYU9
 u6Ag==
X-Gm-Message-State: AOAM533W+7X4Nqn3prc7/QcVAfBwrSy9jzQSv4211Dp+T95NnAGqgGNA
 HujyMV95MY/mBQ/CxeC1AUliJg==
X-Google-Smtp-Source: ABdhPJzQ2dPakrqoKKVuHEfecgUNUdwGzW54b1DqG25NCSXg6CJYrYmnc5PWatkk6bocPzwQZu3q9g==
X-Received: by 2002:a17:902:c411:b029:e9:3d37:afc with SMTP id
 k17-20020a170902c411b02900e93d370afcmr36466483plk.17.1618371721637; 
 Tue, 13 Apr 2021 20:42:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z23sm3372963pjh.45.2021.04.13.20.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 20:42:01 -0700 (PDT)
Date: Tue, 13 Apr 2021 20:42:01 -0700 (PDT)
X-Google-Original-Date: Tue, 13 Apr 2021 20:41:50 PDT (-0700)
Subject: Re: [PATCH] target/riscv: fix exception index on instruction access
 fault
In-Reply-To: <20210413163000.45307-1-emmanuel.blot@sifive.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 emmanuel.blot@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emmanuel.blot@sifive.com
Message-ID: <mhng-a46bc280-de18-4499-9faa-063849ff6d6a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 14 Apr 2021 03:42:06 -0000

On Tue, 13 Apr 2021 09:30:00 PDT (-0700), emmanuel.blot@sifive.com wrote:
> When no MMU is used and the guest code attempts to fetch an instruction
> from an invalid memory location, the exception index defaults to a data
> load access fault, rather an instruction access fault.
> ---
>  target/riscv/cpu_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 21c54ef5613..4e107b1bd23 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -691,8 +691,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>
>      if (access_type == MMU_DATA_STORE) {
>          cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> -    } else {
> +    } else if (access_type == MMU_DATA_LOAD) {
>          cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> +    } else {
> +        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
>      }
>
>      env->badaddr = addr;

You need a Signed-off-by, but otherwise

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

