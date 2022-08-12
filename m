Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMdoF-000087-6g
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 19:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMdoD-00007O-KT
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:11:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMdoB-0003fa-Cj
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:11:17 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so8083144pjz.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 16:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=734bPX7Wfy2HBMau1MFdwdsHB1iSWmvZT49RXJ21gWE=;
 b=q+HEzPI10LWnrlm8qVVFmu3VNSgjGj9IxFLWUAAI6Df72Ti+nwjHgGlaIRd2Pi5Sc4
 ZbKg2CFslhlylgXv2RVz91ZTlfbOdloKb0j9nh9pxYNQR8Ni3iZGgVgBqdgumfAtzLyC
 IgvLOROTo7bkssFrlrnryIKEtRiTgiRVfQk9nnWlI972wN8Myx1B7tW3UteEF39SEVGl
 cPC9OH+2nigaIOvlBUtnBxSJM3byVYfN6x/KkVcN3CFQ2NFjuvHlMIuhL4oF6lNetBCk
 4/Chsqar4SKnqbUr5NSUGDhxRGc1++GflQZk4LwjbQ/0catIqL9h0P4isvhfhfH4b3fi
 zpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=734bPX7Wfy2HBMau1MFdwdsHB1iSWmvZT49RXJ21gWE=;
 b=T+Vx5FDpATpw682BqQXN/ju2SPYmZlS7dXSocSiYs/0qEOaibPLAA+RuXSOfrEhRNv
 cS+JWysYQU2/8dsyL76vBLLMe4rVF8/LnydLPveUfkIKFRtVKnb4Wh5NsMRPTnHyHuLB
 q3zuoMp87rois5BZno5U7o4eH1OoI5gRPyrSK0uwVBc2mlwWJobYDw+W/PnYW+vZ/psf
 FAa3/8d4eUc54tZvQzNvxPCiPpEjyepm7ZXFn7O4zO7Lyeeb0TBxLndEfJTAgnDFC3p8
 rzixZBRp1ncKhms6Vh+siSxYgwfmSqj8lM6ZwX1BWsauxOJI7oST+zxa6n+00siFegUn
 j/Jw==
X-Gm-Message-State: ACgBeo2CneQMjgbXUPe3mur0Oi+qoSzK4usRZ/24/H7a4bQH5NIplQ3s
 uSk6FI2gr30FIjUKKqN98MkwcBY5x9d5c2QUuPos8Q==
X-Google-Smtp-Source: AA6agR7CSVbDNi5/xdRZ1DgB4o2IQWdqN+Z4ApQWNTfVDOWZdxyVgecqX0331Ofrc0pjzcajiP93jc7uVtGl8N40l8I=
X-Received: by 2002:a17:902:7293:b0:16f:17c3:e809 with SMTP id
 d19-20020a170902729300b0016f17c3e809mr6246377pll.158.1660345873511; Fri, 12
 Aug 2022 16:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <CAFEAcA91NRxn5OedUx0pLp1ThO4jLjmRMRbnL3zPRXq4g68qAA@mail.gmail.com>
In-Reply-To: <CAFEAcA91NRxn5OedUx0pLp1ThO4jLjmRMRbnL3zPRXq4g68qAA@mail.gmail.com>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Fri, 12 Aug 2022 16:11:02 -0700
Message-ID: <CA+tJHD7=yATD-uyDt5HR7h5icry5pjYYBpkUq7wkZGcsAZjO7A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=furquan@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Aug 2022 23:11:17 -0000

On Fri, Aug 12, 2022 at 4:28 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 11 Aug 2022 at 21:47, Furquan Shaikh <furquan@rivosinc.com> wrote:
> >
> > Unlike ARM, RISC-V does not define a separate breakpoint type for
> > semihosting. Instead, it is entirely ABI. Thus, we need an option
> > to allow users to configure what the ebreak behavior should be for
> > different privilege levels - M, S, U, VS, VU. As per the RISC-V
> > privilege specification[1], ebreak traps into the execution
> > environment. However, RISC-V debug specification[2] provides
> > ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> > be configured to trap into debug mode instead. This change adds
> > settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> > `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> > should treat ebreak as semihosting traps or trap according to the
> > privilege specification.
> >
> > [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> > [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
>
> As a general rule we don't allow userspace to make semihosting
> calls, as a (rather weak) attempt at fencing off unprivileged
> guest code from being able to scribble all over the host
> filesystem. We should try to be consistent across architectures
> about that, and in particular about how we enable it.
>
> I have a half-finished patchset where I was planning to add
> a --semihosting-config userspace-enable=on option or similar
> to that effect.
>
> It sounds like these ebreak bits are somewhat architectural,
> so maybe they make sense as a riscv specific thing, but we
> should consider how they ought to interact with the general
> behaviour of semihosting. As it stands in QEMU today, we
> (at least in theory) ought not to permit userspace to make
> semihosting ebreak calls at all I think.

Thanks for the feedback, Peter. IIUC, the option that you are planning
to add "--semihosting-config userspace-enable=on" would allow
userspace to make semihosting calls on all architectures. The ebreak
bits here are risc-v specific and hence this change adds it as a
property for RISC-V CPUs. I agree with you that we should be
consistent about how we enable semihosting behavior within qemu.
Without seeing more details of how the config you plan to implement
works, it might be difficult to say how both these fit together. But,
just based on the above understanding, I am thinking we can use the
generic semihosting-config as the top-level config to allow
non-supervisor semihosting. Once your change is ready, we can apply
the additional restriction that these RISC-V ebreak bits for user mode
be settable only if the top-level config is enabled. There are other
ways of handling this too. I am new here and still learning, so open
to any ideas that might make this integration easier.

>
> thanks
> -- PMM

