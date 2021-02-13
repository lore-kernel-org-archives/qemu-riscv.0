Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAxTn-0007Yo-T9
	for mharc-qemu-riscv@gnu.org; Sat, 13 Feb 2021 11:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lAxTm-0007X4-9o; Sat, 13 Feb 2021 11:09:06 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:36993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lAxTa-0001nG-UH; Sat, 13 Feb 2021 11:09:06 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N49Yt-1lsRFs3Sld-01084i; Sat, 13 Feb 2021 17:08:37 +0100
Subject: Re: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, dilfridge@gentoo.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c69d5212-ed5e-c1e5-3dc4-d23b0e6f74d7@vivier.eu>
Date: Sat, 13 Feb 2021 17:08:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VtBBkalUxccH9zPzqaYjKVQ7qVRYLk4qNLGr1RGx8rnNogfZ7E3
 VLr5ZrI0XfwXCZDtGONZrSavvT8dSkpMDhR9aIB9aWIJjG4n8WxcFKgGvugF12VXYrGo1KH
 sAyaSen5peVv95V0RDzfGkFty0tZgMcXRzGY4kTuFsjJ7WGYAJsT+oHkIaQoV45q8pC+D5j
 w3naBGxvY/qI/0ZPxznvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qBrf7r/eRPI=:1Ymowzy9Y7ZwO1S9+WuG/q
 7NqIXkSixp2KGBRsf4jalSiujVZnOZ56hIv6lKVW0NspzZ3Mn1F9JEF6jDv63yCZdvcyhjC3K
 A+ENQ2i/7UHHeMzKMWIBCE3cD9HiWbEnQfQLqU81TP09zX7GX1rd8bF3YzB48IMhcN2BMkFzX
 RBS8qrqs8CMh91eUAJt45dzaKJ68kTHjey/FCVQJiF8t0dbU9Z5Tw/iZhw3CDGaiRlQR/XLOB
 UpAEgqVNWuNR/yA2kS7kdxYGR7mBdte3eF32Y/C+Ha38+NEPm7gTBU5E1EgmkuvoKIO5lSS8R
 Tic6qjXHMd8HFlhv/nL2q+MEjEAAx8ZXL9CRA5JXAtvY6wkypcQZl02A0aGLnor6Pkki5zGH0
 NTW9kNPQzRTYSvv9WePeU+G9NRqmvC79P6y81C/61DJMxigfXcS4qhsxQXDZA+Qea+2sYsO+m
 fw4ksg83xw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 13 Feb 2021 16:09:06 -0000

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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

