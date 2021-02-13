Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAxcR-0002wB-Pe
	for mharc-qemu-riscv@gnu.org; Sat, 13 Feb 2021 11:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lAxcQ-0002un-Fo; Sat, 13 Feb 2021 11:18:02 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:50901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lAxab-0003Aq-OS; Sat, 13 Feb 2021 11:18:02 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6m1g-1lFszk3LrC-008FTP; Sat, 13 Feb 2021 17:15:54 +0100
Subject: Re: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, dilfridge@gentoo.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3f824b7e-2de3-1bc1-6393-433824085119@vivier.eu>
Date: Sat, 13 Feb 2021 17:15:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2yWkASgco/tKU15ZekonQTGciIy5UwoCGvD9hIK4Rjz8lglgyCn
 4ZPxH4bAbxsssthNw4oWEgves/ctLkzBQYQe/GtCueabGIdy1go7YK8orpvy23Xdm38Y0zT
 s0uEs/KMou2oHmlFPl71D7lsVgcKjFKdm3zJu1jBXJRl3bpJD//d5ha2wuD4yZgSm+0agWK
 l2KhwEMmZEKMHFqMp6F+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2GBP2rAJiuA=:24qMqDtIB6/dDN1AaDO7pj
 waoCxMhjJBFnI5yWq8MLJ7ch1Ox3et2M9N19O3TKS1PlqosCZFf8AzRfC3AXndrnA0QsBuk+/
 9A8ivcUEabZ6jizXoWxVWLXevDw8ZkGKZ66Oh+IEbOAJ3XOo3OmuGblm+FM8Fz+u7YHbUCx98
 /CwQgzVOlr9TZZwP7WkqMtv1pUdBRDtWufSiCB8B8trh/9ulNrxR7NiRi93uHQvrMtLc55GhM
 CTzGIzr7cE6ZwQQNdcyq075X3FGv37DBUYougr4p9ktykAoXMKkApS6r+4ZD8aAf9Amc4O1SZ
 l3wLn7f+wZXQUEzhRTaXA9xdDp9I2nVMBmkknq8QFsQJjlKVOEi9aXMiowUZmyAzmuleIDKBD
 JXpwTyQjMEdpxfLLSeBsS/rZEuwHRZyVPqWh5ER8pmDinFqa8tvNogevzv4pHmX/dB5sS+FBO
 J1ScKoTn6A==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 13 Feb 2021 16:18:02 -0000

Le 19/01/2021 à 19:24, Alistair Francis a écrit :
> When mapping the host waitid status to the target status we previously
> just used decoding information in the status value. This doesn't follow
> what the waitid documentation describes, which instead suggests using
> the si_code value for the decoding. This results in the incorrect values
> seen when calling waitid. This is especially apparent on RV32 where all
> wait calls use waitid (see the bug case).
> 
> This patch just passes the waitid status directly back to the guest.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2:
>  - Set tinfo->_sifields._sigchld._status directly from status
> 
>  linux-user/signal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 73de934c65..7eecec46c4 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -349,8 +349,7 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>          case TARGET_SIGCHLD:
>              tinfo->_sifields._sigchld._pid = info->si_pid;
>              tinfo->_sifields._sigchld._uid = info->si_uid;
> -            tinfo->_sifields._sigchld._status
> -                = host_to_target_waitstatus(info->si_status);
> +            tinfo->_sifields._sigchld._status = info->si_status;
>              tinfo->_sifields._sigchld._utime = info->si_utime;
>              tinfo->_sifields._sigchld._stime = info->si_stime;
>              si_type = QEMU_SI_CHLD;
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent

