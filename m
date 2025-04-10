Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA01CC3601E
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:30:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2umb-0002Ce-Bd; Thu, 10 Apr 2025 12:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u2umZ-0002C3-IK
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 12:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u2umW-0005xd-2p
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 12:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744302574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/7B68wkb9iSCIxsM0LHIpGc1m/dojPtkn98DUu1Fwl4=;
 b=iDlMSXjcQKyRQUlXCUelyxnAFFjkJre2/QhyvTSuNC8nAPBZRInJGKlvK5a2uqI7V+virv
 /WiSnrZB5SuoDFtYmDgr7XQgD0BScYPRaxTfrJTUCT3e3wTMr7fD+vaoiIjxlYwul/WzyQ
 4NHk3fh+b/D7rlqlwnrZMPPyB6qdiqY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-99ZGVYGEM6eOwSLOqBn_9w-1; Thu, 10 Apr 2025 12:29:31 -0400
X-MC-Unique: 99ZGVYGEM6eOwSLOqBn_9w-1
X-Mimecast-MFC-AGG-ID: 99ZGVYGEM6eOwSLOqBn_9w_1744302570
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ac6a0443bafso114829366b.2
 for <qemu-riscv@nongnu.org>; Thu, 10 Apr 2025 09:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744302569; x=1744907369;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/7B68wkb9iSCIxsM0LHIpGc1m/dojPtkn98DUu1Fwl4=;
 b=olKfidMUJUab4A34OyIhBOXJG/xtA2VTFSks0anncARFn6G9MP+rGXN5DDWBWSBiOV
 Cu2H6Eoy+ADZ/iTt/PqezxnTeXneMR4i9tvROZ4nvOzLOSXLJNSrYzUYnWMOr042msB/
 sX5baJSi2eWIk1BtirJLd74dvok40+jkabMMIkiyJ+32uAXnRuexltGOExbLuO6GBu++
 zlDUtK4s9onHjOZHoQHmE92L5kMpoUpfGyBEEDYAe+IwRSzG9KeVWW0xbaWBuH4ET1ux
 IjXF+r/Q9cUkkQJjbJc6M4JAiaQsdyielULpAoKk4tJGjLXsCJ7VyQ8WNmZjrLnLrk1t
 WNSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2tuJXih4kGgF9PgaOQbi4VEeasXU6n0LnhTbLiKnKxWTJo3sAP6Ai5f8d6FjtIBv4AFpLGHpOjnAS@nongnu.org
X-Gm-Message-State: AOJu0Yz7LaA87RVZCtszsHz3gJ1CKXbuQmxnZLrR3+H7X2BvfP6qtY3p
 E2PKu8s6IhaaCWjTs7/NFTbJKxFRB2z+UZ6/RgtcKVMpoXC8MPP24ntoPcFv0hUPayy+IP+ijh+
 x+He/GSGHPiXZfEuve7aXyjBniQWRD7Hmp+Ir8gTIpo+EEJXP/gDn
X-Gm-Gg: ASbGncuQkyu96/oSClGhC6Fd6gu0PV2cobA7qoGD8gF1I1jA1Go1nKZQExKniCAWaXO
 9y38wtyDnx4r8nhABTZ9ysjVFQ52Py9sDK22VaIwAe2InCgYa71PR5exINaRHDOTcXyYzZ2BadG
 jC6fQAq8tWeAkv5sQ8zFyyRY8QTfkBesBItCJ12A7YoIENNhwFayvvDRCD7D9avN/R+LWeOKBsJ
 fYAvAdQe8C69uOO6Mfa09CGYyvQFf6GkzuVucgfrMlyUXesuGwzezO0YBqsRwb1Vs3zObB88+/1
 TYQJkcjz0b2A6YqQO4qPEZrJlNk2kfrbBTXIAdzM1QRnSep5jA==
X-Received: by 2002:a17:906:c318:b0:aca:c681:964c with SMTP id
 a640c23a62f3a-acac68196fdmr144672066b.45.1744302569563; 
 Thu, 10 Apr 2025 09:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy2sUoc+E49+OixicnVNxgAEXn4kqhw7Vm5RS2+Ti9IT8CSWNVRGkbYN/+UnENNj7RYHAt9g==
X-Received: by 2002:a17:906:c318:b0:aca:c681:964c with SMTP id
 a640c23a62f3a-acac68196fdmr144668966b.45.1744302569111; 
 Thu, 10 Apr 2025 09:29:29 -0700 (PDT)
Received: from [192.168.213.210] (93-33-70-196.ip43.fastwebnet.it.
 [93.33.70.196]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5f2fbbac8a5sm2621944a12.14.2025.04.10.09.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 09:29:28 -0700 (PDT)
Message-ID: <2e9cb17e-47a4-49d3-a815-612bcbdcc92d@redhat.com>
Date: Thu, 10 Apr 2025 18:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] hw/9pfs: Allow using hw/9pfs with emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <16376e4b63fad6f847ceadb39b8f9780fc288198.1744032780.git.ktokunaga.mail@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <16376e4b63fad6f847ceadb39b8f9780fc288198.1744032780.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3nWBBydKedzLOG61D7AHjnt359qna2NMP_qgAZa91g8_1744302570
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.593,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 4/7/25 16:45, Kohei Tokunaga wrote:
> Emscripten's fiber does not support submitting coroutines to other
> threads. 

Does it work as long as the thread does not rewind?

> diff --git a/hw/9pfs/9p-util-stub.c b/hw/9pfs/9p-util-stub.c
> new file mode 100644
> index 0000000000..57c89902ab
> --- /dev/null
> +++ b/hw/9pfs/9p-util-stub.c
> @@ -0,0 +1,43 @@
> +/*
> + * 9p utilities stub functions
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "9p-util.h"
> +
> +ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
> +                             void *value, size_t size)
> +{
> +    return -1;
> +}
> +
> +ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +                              char *list, size_t size)
> +{
> +    return -1;
> +}
> +
> +ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +                                const char *name)
> +{
> +    return -1;
> +}
> +
> +int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
> +                         void *value, size_t size, int flags)
> +{
> +    return -1;
> +
> +}
> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    return -1;
> +}
> +
> +ssize_t fgetxattr(int fd, const char *name, void *value, size_t size)
> +{
> +    return -1;
> +}

You can add all these to the stubs/emscripten.c file that I suggested 
elsewhere.

> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 7bc4ec8e85..8c5006fcdc 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -84,6 +84,24 @@ static inline int errno_to_dotl(int err) {
>       } else if (err == EOPNOTSUPP) {
>           err = 95; /* ==EOPNOTSUPP on Linux */
>       }
> +#elif defined(EMSCRIPTEN)
> +    /*
> +     * FIXME: Only most important errnos translated here yet, this should be
> +     * extended to as many errnos being translated as possible in future.
> +     */
> +    if (err == ENAMETOOLONG) {
> +        err = 36; /* ==ENAMETOOLONG on Linux */
> +    } else if (err == ENOTEMPTY) {
> +        err = 39; /* ==ENOTEMPTY on Linux */
> +    } else if (err == ELOOP) {
> +        err = 40; /* ==ELOOP on Linux */
> +    } else if (err == ENODATA) {
> +        err = 61; /* ==ENODATA on Linux */
> +    } else if (err == ENOTSUP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    } else if (err == EOPNOTSUPP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    }
>   #else
>   #error Missing errno translation to Linux for this host system
>   #endif
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 7cad2bce62..4f45f0edd3 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -4013,6 +4013,9 @@ out_nofid:
>    * Linux guests.
>    */
>   #define P9_XATTR_SIZE_MAX 65536
> +#elif defined(EMSCRIPTEN)
> +/* No support for xattr */
> +#define P9_XATTR_SIZE_MAX 0
>   #else
>   #error Missing definition for P9_XATTR_SIZE_MAX for this host system
>   #endif
> diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
> index 2c54249b35..7b0d05ba1b 100644
> --- a/hw/9pfs/coth.h
> +++ b/hw/9pfs/coth.h
> @@ -19,6 +19,7 @@
>   #include "qemu/coroutine-core.h"
>   #include "9p.h"
>   
> +#ifndef EMSCRIPTEN
>   /*
>    * we want to use bottom half because we want to make sure the below
>    * sequence of events.
> @@ -57,6 +58,17 @@
>           /* re-enter back to qemu thread */                              \
>           qemu_coroutine_yield();                                         \
>       } while (0)
> +#else
> +/*
> + * FIXME: implement this on emscripten but emscripten's coroutine
> + * implementation (fiber) doesn't support submitting a coroutine to other
> + * threads.
> + */
> +#define v9fs_co_run_in_worker(code_block)                               \
> +    do {                                                                \
> +        code_block;                                                     \
> +    } while (0)
> +#endif

You could extracting v9fs_co_run_in_worker()'s bodies into separate 
functions.  It is tedious but not hard; all you have to do is define 
structs for the to parameters and return values of v9fs_co_*(), unpack 
them in the callback functions, and retrieve the return value in 
v9fs_co_*().  Many functions

The advantage is that, instead of all the bottom half and yielding dance 
that is done by v9fs_co_run_in_worker() and co_run_in_worker_bh(), you 
can just use thread_pool_submit_co().

Paolo

>   void co_run_in_worker_bh(void *);
>   int coroutine_fn v9fs_co_readlink(V9fsPDU *, V9fsPath *, V9fsString *);
> diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
> index d35d4f44ff..04f85fb9e9 100644
> --- a/hw/9pfs/meson.build
> +++ b/hw/9pfs/meson.build
> @@ -17,6 +17,8 @@ if host_os == 'darwin'
>     fs_ss.add(files('9p-util-darwin.c'))
>   elif host_os == 'linux'
>     fs_ss.add(files('9p-util-linux.c'))
> +elif host_os == 'emscripten'
> +  fs_ss.add(files('9p-util-stub.c'))
>   endif
>   fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
>   system_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
> diff --git a/meson.build b/meson.build
> index ab84820bc5..a3aadf8b59 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2356,11 +2356,11 @@ dbus_display = get_option('dbus_display') \
>     .allowed()
>   
>   have_virtfs = get_option('virtfs') \
> -    .require(host_os == 'linux' or host_os == 'darwin',
> +    .require(host_os == 'linux' or host_os == 'darwin' or host_os == 'emscripten',
>                error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
> -    .require(host_os == 'linux' or cc.has_function('pthread_fchdir_np'),
> +    .require(host_os == 'linux' or host_os == 'emscripten' or cc.has_function('pthread_fchdir_np'),
>                error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
> -    .require(host_os == 'darwin' or libattr.found(),
> +    .require(host_os == 'darwin' or host_os == 'emscripten' or libattr.found(),
>                error_message: 'virtio-9p (virtfs) on Linux requires libattr-devel') \
>       .disable_auto_if(not have_tools and not have_system) \
>       .allowed()


