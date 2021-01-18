Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1Vdq-0000l9-Ob
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jan 2021 09:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Vdp-0000kj-Fh; Mon, 18 Jan 2021 09:36:25 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:52787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Vdn-00080u-AE; Mon, 18 Jan 2021 09:36:25 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAwTn-1lCGCn2F8D-00BJNo; Mon, 18 Jan 2021 15:36:16 +0100
Subject: Re: [PATCH v1 1/1] linux-user/signal: Decode waitid si_code
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <eac70d13-7e70-756e-503c-329fdb14a312@vivier.eu>
Date: Mon, 18 Jan 2021 15:36:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V6OfQqlm2VvFg1zeC4EZFTc9lylc3WSMcp/D7Qc7wu6ju+0BmME
 RRU6B6fEUBHUIjBzHiblF+4Fp4+viT7Bm8UW5Ftqbm6O2CpRdTwsLgFBfsB/2LIz/A558M7
 ZV1QJfg9yvsvwZ73NnOb596ZExxY4NgICSoYlpYBA6e2M7BDZHazCBaAGO/sot61kUub34O
 ZaGbZfFnCklTeyn9y6oDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7gN2Jn6gXNY=:sg05yga2fGUEK/p4O9rx5h
 Yq3UGUrPs3ymHKVCiJSjDJHYny/KUWrIvG4Exabg8CK4LkO1GYJc6clj3OKN/BVem9Eubw8OG
 YBP0tCTRmFd/gTDTi3/0xpglTsFNUepjEqVkTysq3iodn8xYnsjJv/WlsezJvk13bMqVYCXlq
 baVYSnqShw4sCA17BvAhwmju0VDfpF39YHl1/VR+R/fIMLDtMqT6lOVuBhX+H1cIS3LuJkliz
 l9J+XUDxPMBC9rs4bx7+zhdmX8zJSUVLyWohcEw6pYlkH1kAiPWi4EvmeeT3bpuxdGeRx85cE
 Iy7iCdEfzCGY3N/hsN/6TJxF5mRyQ8wGBpumbmm17gxIQPyDpMhOCKAR/v7Q+qo6JFVkJFnF3
 B6ppfjbIrFaML1Z7VyMUGTaQ9VuCh1jWnbViaQwzTe9jt6qBgq4G9oXmNTQqI
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.194,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 18 Jan 2021 14:36:25 -0000

Le 19/12/2020 à 19:11, Alistair Francis a écrit :
> When mapping the host waitid status to the target status we previously
> just used decoding information in the status value. This doesn't follow
> what the waitid documentation describes, which instead suggests using
> the si_code value for the decoding. This results in the incorrect values
> seen when calling waitid. This is especially apparent on RV32 where all
> wait calls use waitid (see the bug case).
> 
> This patch uses the si_code value to map the waitid status.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  linux-user/signal.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 73de934c65..b6c9326521 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -305,6 +305,7 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>      int sig = host_to_target_signal(info->si_signo);
>      int si_code = info->si_code;
>      int si_type;
> +    int status = info->si_status;
>      tinfo->si_signo = sig;
>      tinfo->si_errno = 0;
>      tinfo->si_code = info->si_code;
> @@ -349,8 +350,29 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>          case TARGET_SIGCHLD:
>              tinfo->_sifields._sigchld._pid = info->si_pid;
>              tinfo->_sifields._sigchld._uid = info->si_uid;
> -            tinfo->_sifields._sigchld._status
> -                = host_to_target_waitstatus(info->si_status);
> +
> +            /*
> +             * Map host to target signal numbers for the waitid family of
> +             * syscalls. This is similar to the functionality in
> +             * host_to_target_waitstatus() except we use the si_code to
> +             * determine the operation.
> +             */
> +            switch (info->si_code) {
> +            case CLD_KILLED:
> +            case CLD_DUMPED:
> +                tinfo->_sifields._sigchld._status =
> +                    host_to_target_signal(WTERMSIG(status)) |
> +                                          (status & ~0x7f);
> +                break;
> +            case CLD_STOPPED:
> +                tinfo->_sifields._sigchld._status =
> +                (host_to_target_signal(WSTOPSIG(status)) << 8) |
> +                    (status & 0xff);
> +                break;
> +            default:

I guess the the operation is not encoded in the status coming from the host as we need to use the
si_code to decode the status, so why do we need to encode it in the status we send to the guest?

Can it be only "tinfo->_sifields._sigchld._status = status" for all the cases?

Thanks,
Laurent

