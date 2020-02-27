Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j76dW-0003RH-JL
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 19:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j76dU-0003Od-C6
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 19:02:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j76dT-0007tR-9v
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 19:02:40 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:57653)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j76dT-0007pY-14; Wed, 26 Feb 2020 19:02:39 -0500
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MNtny-1inOzF3g7M-00OEje; Thu, 27 Feb 2020 01:02:30 +0100
Subject: Re: [PATCH v2 2/2] linux-user/riscv: Update the syscall_nr's to the
 5.5 kernel
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <cover.1582586444.git.alistair.francis@wdc.com>
 <85f33856ee6f32125e5c81a9561346b28b340a3e.1582586444.git.alistair.francis@wdc.com>
 <24431d59-b535-97d4-95d7-fe4401e10787@vivier.eu>
 <CAKmqyKObXNXj2jsMYTvAL-eHS43Wb5upwq6mHeHo7q-4Pr4W7g@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fd0e0b49-b2c4-9adf-8cbe-9e160b89f9f2@vivier.eu>
Date: Thu, 27 Feb 2020 01:02:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKObXNXj2jsMYTvAL-eHS43Wb5upwq6mHeHo7q-4Pr4W7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:viEirk3XuTzzrZK2NS7lcTxaNpXHnDZIj5UJNR+nJnjMdjds2y3
 hsBCZyrifyxHTOyVHzEFxkVi9bYcEnTuf1tXFhsYwiedJXMyeDivlcbKt2v/TpAd2c9y3ub
 4huEiKon/qRxpVvUTVhq5oOTW8m1/WJnnnbuGgL9k9hr72rTT12VYyfCqQ099QE/hHMNXs9
 3M1TsTWGZA7fSbTpRmGDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IiIES79BAtM=:YdQo401CHi0fXA+JXhx4JU
 a6edAQ8Un45r3D8nal8494WApAM7O8QZgGkuQg3vNRvklFrHe6cqmw2qgxzWHYTy5bxyICxo0
 oei5NrYUiWBl4sYb6jbXuNVvbhsTyKVoLKdmHJtgbW0rwemAdXq8D5nEYm8eEKmpUxqeqHSfE
 j3R7iitIFiN9iuhL4ReQhuURjkgF0jgKhPMVfi6Y7EpRoaPzHx8TCvtGvTApoU85QppfaQZAA
 RPw0lZnWHm2nhC8A179umyLFE/0q8ko+3O7BPNpyYLM4KT83vJxth8XIqDu41YIrDWN4sDcbq
 drSiTW3TRoLJf1p44VUlrtNdKz3SkOtxJMPc7od+O5XvRy3D7E4SzlK0Z9pM4n9nykoR8pRud
 YrazJ4bhrzlVh1C2ZAYveVmdkAwc1eqDFwbSpDhDqR3ZsPRFOIggXMHHFbRZST4fcSqst8Ddp
 ZWXMvgGadJw+tSLmkjqPpVeZDYEO8rb/Ep/O9emi3GMkVN3nDMdsc3NsReCb3w8o5FmYRFoPY
 H/luE7c/4ZiFmJyGe+6GIonnHy8XcjQXeythMz4sJj0Dcu+wnQlYj1rRET5fbinFZEOAqko4T
 737DIxr/08cYccMN1XnoUuzzjKGbMkifQOiLXY0I26AWTpyYUdLKn44Skl3jn1JEi/F5/B0+R
 AdSKJxyumuLkFss9PWlP5BvrMXMOfHP7Y94kehAJ0l3Uu34CnwLOKeRHhc6nm00YCwsJQpOIV
 NcBDwjkx9YDrqKTtGwScKOut1sP1hv89zmXksPT+eBqVy7BpdvFYgiEBho9S6My14okbKzfEU
 kHYBsYMyweEgfJoG8mJRs8UkudhuJ9n6A6xk/BUD8DjUHLfcimyGRTLJvOOlv2R3GJ2oFid
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
X-List-Received-Date: Thu, 27 Feb 2020 00:02:41 -0000

Le 26/02/2020 à 20:32, Alistair Francis a écrit :
> On Tue, Feb 25, 2020 at 3:50 AM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 25/02/2020 à 00:21, Alistair Francis a écrit :
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
...
>> I think you can remove following defintion as they should be translated
>> by the target glibc.
> 
> glibc won't be exposing these externally, the current plan is just to
> use this internally to glibc.

But if they are defined internally to glibc, glibc will always translate
the older ones to the 64bit ones and thus glibc will never use the older
ones with the kernel, only the 64bit ones, thus the older syscalls
should never come to QEMU.

So why do we need to define the translation older-to-64bit in QEMU too?

> 
>>
>>> +/*
>>> + * Alias some of the older pre 64-bit time_t syscalls to the 64-bit
>>> + * ones for RV32. This is based on the list used by glibc.
>>> + */
>>> +#define TARGET_NR_futex TARGET_NR_futex_time64
>>> +#define TARGET_NR_rt_sigtimedwait TARGET_NR_rt_sigtimedwait_time64
>>> +#define TARGET_NR_ppoll TARGET_NR_ppoll_time64
>>> +#define TARGET_NR_utimensat TARGET_NR_utimensat_time64
>>> +#define TARGET_NR_pselect6 TARGET_NR_pselect6_time64
>>> +#define TARGET_NR_recvmmsg TARGET_NR_recvmmsg_time64
>>> +#define TARGET_NR_semtimedop TARGET_NR_semtimedop_time64
>>> +#define TARGET_NR_mq_timedreceive TARGET_NR_mq_timedreceive_time64
>>> +#define TARGET_NR_mq_timedsend TARGET_NR_mq_timedsend_time64
>>> +#define TARGET_NR_clock_getres TARGET_NR_clock_getres_time64
>>> +#define TARGET_NR_timerfd_settime TARGET_NR_timerfd_settime64
>>> +#define TARGET_NR_timerfd_gettime TARGET_NR_timerfd_gettime64
>>> +#define TARGET_NR_sched_rr_get_interval TARGET_NR_sched_rr_get_interval_time64
>>> +#define TARGET_NR_clock_adjtime TARGET_NR_clock_adjtime64
>>> +
>>> +#endif
>>> diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/syscall64_nr.h
>>> new file mode 100644
>>> index 0000000000..b58364b570
>>> --- /dev/null
>>> +++ b/linux-user/riscv/syscall64_nr.h
>>
>> syscall64_nr.h is correct.
>>
>> Thanks,
>> Laurent
>>
> 


