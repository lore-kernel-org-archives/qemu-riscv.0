Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maCO4-0004DY-EO
	for mharc-qemu-riscv@gnu.org; Tue, 12 Oct 2021 03:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maCO1-00046o-3m; Tue, 12 Oct 2021 03:39:45 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maCNz-0008IA-D5; Tue, 12 Oct 2021 03:39:44 -0400
Received: by mail-io1-xd35.google.com with SMTP id p68so22671492iof.6;
 Tue, 12 Oct 2021 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r9aN09R7wnYzkgKHL5g51xe6uJ5JxImHbLCLuebNMtA=;
 b=b8QsujY1GWK5Uc85f9u6f/CBbeTg/Wv6PPAnr7lkMFlItyPcwAMlsF0aY3562+vk0S
 imoelxhla5fZSnWFw399Aw0GSIhwBWSaJ/5b//zgINDkJhw2vAou9DYABY++c0ZbV38l
 VeqpOVrDy9PjXRB8eaB1L+NL4TfFG8aWjijKQYCTzhVWW0cJl6E37OUJZjYw/jIhUCwb
 Y1JZmpH9LCxUef/q1yOOkqri/NclMFv80KebzH2TFu3Ugkt4DX43OK9RhaWwKGCVeJ3i
 piMBZOUnQ+C5whTKHwUoBTS2Z20wECSnJhIEFO44JbBgUGky0SgL5pAerFyaaCNTma5i
 woqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r9aN09R7wnYzkgKHL5g51xe6uJ5JxImHbLCLuebNMtA=;
 b=QNaAE0i2apXQT0pvW/StCjU4EhbgbROfv85yWKjhpA7VI6OMdS+RIOZY3Uurg38kaq
 Pa1rNwaGOIod6CVJdK7oYqiQM57hcPrzaBJtF3aD1Jkb4ZtmylW9bSDqLesJ+p7eE52b
 p9lJg7uY5d4yqTScUiiMcw1irkkGYizHGLCKEQZU9UYPsYt7PGcTMTI89CHSTtJVhwAv
 V9jAYNT97vx3akBMuEyMK7IDB6XwWRkCGRpbi8xHIj9IJdgwsV4fN8tZxOQZXc4M/9oZ
 3pZXr5EhCaLxsOIc3o5VUKBEgPsB0YyXs11bFSNgO/7QMReS7SySOvnoOTmpuqUCL3Rn
 PMNA==
X-Gm-Message-State: AOAM532aTVyCaKkWkL5CudodaODtNkZFoC9dbvWDq8v4C6dVre//5khJ
 fufTw1CCtgNTPNvNuCBfT/LB6Yxr+rqziHa+LV0=
X-Google-Smtp-Source: ABdhPJwVvBaqv1Txgkmyu0OKZFEy74ArDUvbxid0b3buYBv6i2RLcTQZcEjrGClrSLBl+dWCLp54oxAt00aktlmzxIo=
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr22711768iod.16.1634024381724; 
 Tue, 12 Oct 2021 00:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211009055019.545153-1-travisg@gmail.com>
In-Reply-To: <20211009055019.545153-1-travisg@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Oct 2021 17:39:15 +1000
Message-ID: <CAKmqyKN7Ssi8+bD7TMnUfU4-N=d=-X-2zG0cx7BBGUjTCchuxQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: line up all of the registers in the info
 register dump
To: Travis Geiselbrecht <travisg@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Tue, 12 Oct 2021 07:39:45 -0000

On Sat, Oct 9, 2021 at 3:51 PM Travis Geiselbrecht <travisg@gmail.com> wrote:
>
> Ensure the columns for all of the register names and values line up.
> No functional change, just a minor tweak to the output.
>
> Signed-off-by: Travis Geiselbrecht <travisg@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

