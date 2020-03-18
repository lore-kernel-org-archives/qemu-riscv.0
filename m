Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEiER-00021K-Eh
	for mharc-qemu-riscv@gnu.org; Wed, 18 Mar 2020 19:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jEiEP-00021E-81
 for qemu-riscv@nongnu.org; Wed, 18 Mar 2020 19:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jEiEO-0006PF-0n
 for qemu-riscv@nongnu.org; Wed, 18 Mar 2020 19:36:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:22742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jEiEN-0006Oc-Ti
 for qemu-riscv@nongnu.org; Wed, 18 Mar 2020 19:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584574571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqeJV6ZBB1y7AvzEjwvYrxx2ENDsJ9EmmSpOqC6+J6c=;
 b=ZsZC0RCL7ITr4sy3mzBg76O+DavAD6qSE6lYNK7WR1j/qqGJYUXxjGvUBybnDcOMXTC5zE
 SBWZQoYusHTaxE2Ss3fSXywMzqYjhr7GdncOx6FdCdwpcYT+YuV5W//MADHZTCL96ts/RI
 QGq2dRMlUnk85jmhFgdqnxJFQUgFuNg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-km0oqlbuP_mUzRg4DFA9Ng-1; Wed, 18 Mar 2020 19:36:09 -0400
X-MC-Unique: km0oqlbuP_mUzRg4DFA9Ng-1
Received: by mail-wr1-f71.google.com with SMTP id v6so84333wrg.22
 for <qemu-riscv@nongnu.org>; Wed, 18 Mar 2020 16:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/ce65HuK5Va/fXZDv78iB3miS0aXLw/3AF48gSxWI8=;
 b=oly5s+OmoNb0Tsqtv67XnoMUz+h6HMs46cPUZ6kC3B7C3mhJ8r88tDzMwZ0ztUk45U
 tA4XvH6XcO9KdG+SFc4OxVDdM1YvpAuzH0tsZ/ja95tHXQdUa1Z+DFVJ2EpButZpM+zW
 DvqmDMuidkVc+050yZm/I9JRhRdeMSuLa/0NChOy3rX8wcFtmP3udYqnFSu1H66aKGvw
 t1JV5GvgveRpurcp3cnUFUBOhceFwHI3b1yqBjl6dLTb9yVrlklCimpGZy2YdaBwju9B
 lCyuDz+6RZ5wLbQUBwmZE8j0FtNI0V83syDb7t2Pf9gqXD9DHNRcLxWzWFJAN+ykqh9A
 mbLQ==
X-Gm-Message-State: ANhLgQ2jK/9dJ5NZCcCvNJh4+80dlpKspkdnnyA6Y/soWsYz9jrvzuuv
 Jpsg/fvbLWfmaQlLxAvGzSll+t+9eJrHu/jlyxf2wA/kFLq87HdWcMPijENtsr6wPAa7fDniqNE
 YecvNgYbj0thc5Tk=
X-Received: by 2002:adf:e345:: with SMTP id n5mr405626wrj.220.1584574568850;
 Wed, 18 Mar 2020 16:36:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuEK/qGf1vD3nw1jRdwmNbNPr89m/jCp/eUI99GUJo0I3w34zx7ipwYiH0L3lmFxzTBQnHtjA==
X-Received: by 2002:adf:e345:: with SMTP id n5mr405611wrj.220.1584574568667;
 Wed, 18 Mar 2020 16:36:08 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id q13sm537504wrs.91.2020.03.18.16.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 16:36:08 -0700 (PDT)
Subject: Re: [PATCH v9 2/4] linux-user/syscall: Add support for
 clock_gettime64/clock_settime64
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, laurent@vivier.eu
Cc: palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1584571250.git.alistair.francis@wdc.com>
 <56b8fd28a0faca77ee8adfc90e4eb2bc3750edf5.1584571250.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c956f99f-0412-d0c9-c489-bf904b6d7bea@redhat.com>
Date: Thu, 19 Mar 2020 00:36:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <56b8fd28a0faca77ee8adfc90e4eb2bc3750edf5.1584571250.git.alistair.francis@wdc.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Wed, 18 Mar 2020 23:36:14 -0000

On 3/18/20 11:46 PM, Alistair Francis wrote:
> Add support for the clock_gettime64/clock_settime64 syscalls.
>=20
> If your host is 64-bit or is 32-bit with the *_time64 syscall then the
> timespec will correctly be a 64-bit time_t. Otherwise the host will
> return a 32-bit time_t which will be rounded to 64-bits. This will be
> incorrect after y2038.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/syscall.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 909bec94a5..60fd775d9c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1229,6 +1229,22 @@ static inline abi_long target_to_host_timespec(str=
uct timespec *host_ts,
>   }
>   #endif
>  =20
> +#if defined(TARGET_NR_clock_settime64)
> +static inline abi_long target_to_host_timespec64(struct timespec *host_t=
s,
> +                                                 abi_ulong target_addr)
> +{
> +    struct target__kernel_timespec *target_ts;
> +
> +    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1)) {
> +        return -TARGET_EFAULT;
> +    }
> +    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
> +    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
> +    unlock_user_struct(target_ts, target_addr, 0);
> +    return 0;
> +}
> +#endif
> +
>   static inline abi_long host_to_target_timespec(abi_ulong target_addr,
>                                                  struct timespec *host_ts=
)
>   {
> @@ -11458,6 +11474,18 @@ static abi_long do_syscall1(void *cpu_env, int n=
um, abi_long arg1,
>           return ret;
>       }
>   #endif
> +#ifdef TARGET_NR_clock_settime64
> +    case TARGET_NR_clock_settime64:
> +    {
> +        struct timespec ts;
> +
> +        ret =3D target_to_host_timespec64(&ts, arg2);
> +        if (!is_error(ret)) {
> +            ret =3D get_errno(clock_settime(arg1, &ts));
> +        }
> +        return ret;
> +    }
> +#endif
>   #ifdef TARGET_NR_clock_gettime
>       case TARGET_NR_clock_gettime:
>       {
> @@ -11469,6 +11497,17 @@ static abi_long do_syscall1(void *cpu_env, int n=
um, abi_long arg1,
>           return ret;
>       }
>   #endif
> +#ifdef TARGET_NR_clock_gettime64
> +    case TARGET_NR_clock_gettime64:
> +    {
> +        struct timespec ts;
> +        ret =3D get_errno(clock_gettime(arg1, &ts));
> +        if (!is_error(ret)) {
> +            ret =3D host_to_target_timespec64(arg2, &ts);
> +        }
> +        return ret;
> +    }
> +#endif
>   #ifdef TARGET_NR_clock_getres
>       case TARGET_NR_clock_getres:
>       {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


