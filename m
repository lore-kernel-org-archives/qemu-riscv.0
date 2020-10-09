Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kR0eU-0005ss-79
	for mharc-qemu-riscv@gnu.org; Fri, 09 Oct 2020 18:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kR0eS-0005p7-4j; Fri, 09 Oct 2020 18:14:12 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kR0eQ-0005KK-GP; Fri, 09 Oct 2020 18:14:11 -0400
Received: by mail-io1-xd42.google.com with SMTP id m17so11871945ioo.1;
 Fri, 09 Oct 2020 15:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRgcP74qvwlQr+b82xawd6W0J/RP4NL/CRm4biQAMFE=;
 b=Tb7T1xFwIJGC01240ZoQA8HLUSD4njBKRHOmpRNiHeBlSB6zrUROS0n/Haw3zPmro2
 Udh8nsxB7DX+6SVknhYvOk4/SAmU//Evs51yX6x7CW1+MnxgF2MyOIdZ+YP8up8yRX1R
 eFUtrHJLohrCK56kjMr2yjyUo4IyW3n9U6C3OasE4ind1P+S+N6c2/Ofm28sm/1aOe0f
 6zPB5kWZeu3SOhd4b1uJF3Zh6Up2LsUWKLEqQ5J8woGoXmBzO3QhvmM8MUsTlAhskcpB
 t9ci3Jg2BRBFkBwmZRHNPT4QHlaSNIxXScKxo6YvDYv8cDbXwIHX7nXQY5o0o5q9nkEm
 WMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRgcP74qvwlQr+b82xawd6W0J/RP4NL/CRm4biQAMFE=;
 b=Zf+2FZtpz7bCF/b+q6H2PmfiH76O/YT2YVpr1rKOEY0H7PmAdL7hg4YYdyp87TwaUW
 0zpR7zH5RZVBk03QpuAm4WWXMjg55Zs9n3rSKa0ub2XIx2xmp+G143MMcA/ZL3asEHcd
 dXk3f/DHIdwnGOsHH/xd3flSvOXGOugahAebqxa36FYTHQVeVuzIRh9bK4eZMKNdRYew
 ykNkN+RckgJqVHm1zhhOzrhWxYpM8Y3tTGVTmsuTv0fFluNxHt86+OzGxVDJM4/pvMwu
 kSH+qEghjQevzML4906vanj9hGf1sE1u/0DSY+dsPz2Z/E7M/VUCfP5Gyq26tnXeQNwH
 PUUw==
X-Gm-Message-State: AOAM532T3e34RMd4heuvrVLdpGAprluKyWP0IRbyQsWKUe4UlT5UjDhs
 IkzRXwKg9SiQ4l8z7SQO7Zq8HeeXFDTRCwrSIFk=
X-Google-Smtp-Source: ABdhPJzvwzjM4iT75C/2BJZoaTyx1FU9QcsfOL4WfDkOWoIycX4ool3IliXk+m7O5XrToMs0jwo+aUaC+IH1mM4z3Jg=
X-Received: by 2002:a05:6638:a90:: with SMTP id
 16mr2269625jas.91.1602281648895; 
 Fri, 09 Oct 2020 15:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201009113843.60995-1-lvivier@redhat.com>
 <20201009113843.60995-2-lvivier@redhat.com>
In-Reply-To: <20201009113843.60995-2-lvivier@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Oct 2020 15:02:35 -0700
Message-ID: <CAKmqyKN_tguOw=Jvpb+=88r2+fn2DyU1kHgASy5WxnZcZu9BmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] goldfish_rtc: change MemoryRegionOps endianness to
 DEVICE_NATIVE_ENDIAN
To: Laurent Vivier <lvivier@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Anup Patel <Anup.Patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 09 Oct 2020 22:14:12 -0000

On Fri, Oct 9, 2020 at 4:40 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> The doc [1] doesn't define the endianness, but the kernel driver
> uses readl() to access the registers, so we can guess it depends
> on the architecture endianness.
>
> As riscv architecture endianness is little it might not change anything
> for it.
>
> Moreover, android implementation uses DEVICE_NATIVE_ENDIAN [2]
>
> [1] https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
> [2] https://android.googlesource.com/platform/external/qemu/+/refs/heads/emu-master-dev/hw/timer/goldfish_timer.c#177
>
> Fixes: 9a5b40b84279 ("hw: rtc: Add Goldfish RTC device")
> Cc: Anup.Patel@wdc.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/rtc/goldfish_rtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
> index 6ddd45cce039..0f4e8185a796 100644
> --- a/hw/rtc/goldfish_rtc.c
> +++ b/hw/rtc/goldfish_rtc.c
> @@ -217,7 +217,7 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
>  static const MemoryRegionOps goldfish_rtc_ops = {
>      .read = goldfish_rtc_read,
>      .write = goldfish_rtc_write,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid = {
>          .min_access_size = 4,
>          .max_access_size = 4
> --
> 2.26.2
>
>

