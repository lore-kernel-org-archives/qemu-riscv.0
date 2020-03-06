Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jA9h0-0005qe-5W
	for mharc-qemu-riscv@gnu.org; Fri, 06 Mar 2020 04:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jA9gx-0005nS-OF
 for qemu-riscv@nongnu.org; Fri, 06 Mar 2020 04:54:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jA9gw-0004wI-DC
 for qemu-riscv@nongnu.org; Fri, 06 Mar 2020 04:54:51 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44346)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jA9gw-0004tS-61
 for qemu-riscv@nongnu.org; Fri, 06 Mar 2020 04:54:50 -0500
Received: by mail-oi1-x243.google.com with SMTP id d62so1939072oia.11
 for <qemu-riscv@nongnu.org>; Fri, 06 Mar 2020 01:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5mqvOeQPRdC0xpis/LcpEbxJY2rwTbFGI1AuPRFCDp4=;
 b=C1ks/bWdi4sJWrj8rP0VkhNTH9vBVhh0x5NLd2w5nsVJWijOTIWpvsPEspaKdMYcsG
 /D7q3Nmm+zQ4v/eR3gEnq5/ID5qme1f04xY+hZu7jkQ9qmovzlEf/GTrcimn7rguyXlZ
 ATO1wwprP1IkZiQtNEA/L7y35QcRYLtxcE2xvG53WPE8vvq3kValKG8FEW0mIQKrFZ2E
 8eSHTtUGfTgebWUxOG7Kvv+tVTTayEG9geYXrjYSpHoQJA0k62JSkClV0IxXX28i/9TB
 eXfz+o8h5Jr41kzrjKebB8FWGpnVSTrHkICLusVQMw2122zoifoNoxF8UuUUCaeCQ35u
 WM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5mqvOeQPRdC0xpis/LcpEbxJY2rwTbFGI1AuPRFCDp4=;
 b=JFHdDToxtpAByK1OwXN2PKNgDeKlwolTW/LeUAMFhPp3cul6yiJ3oz7VzIqrUoukM6
 YlmWz3D2APyhDtzXpx4ZbhVag/utdEsnQ6UkRem9he1IbMHGZVKyqdwruq7Pw6wtxkWb
 qioYul2pUvPVXugVPVcXGQKHxGx0N0i3tFcVWjJT/WNIeUvrBpF9PjSc7yY4mW2MyWl7
 pqbcb4dsr/00JVw7V17F/iq/qVjP8+u7b5D588rv8HEbUQRdG0qEfof7TePuHaBmmo73
 Cevgbf7M8Uy432J1uiJ0edlmQdQHW6lb717XFn1p0WE8wdi/VVp+h0rkVke7rcvbZb1L
 +XjA==
X-Gm-Message-State: ANhLgQ2/jw9j6FmLr6IcdAyHPYIXyeZOxyRmbIiSUTzvJyR9Uf3g88Zb
 c46JEDURtCqxmmyJziTTzjnJqQShxlLzsfrgPsBsdw==
X-Google-Smtp-Source: ADFU+vudnS6HLIw9sZOxbuyM7gYSDQ1TmH8IKV5dnmKszldvaXDN8HTQyHL2Shfi+Hq6cGAAlJQZLsK3tnoCfOJqWDY=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr1989658oid.98.1583488488963;
 Fri, 06 Mar 2020 01:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20200305200558.71104-1-palmerdabbelt@google.com>
In-Reply-To: <20200305200558.71104-1-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2020 09:54:37 +0000
Message-ID: <CAFEAcA8vUdrYRbi+KxHDaMiE2enUWKEZujYGN6yJnUdrATMr-g@mail.gmail.com>
Subject: Re: [PULL] A single RISC-V fixup
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Fri, 06 Mar 2020 09:54:52 -0000

On Thu, 5 Mar 2020 at 20:06, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> merged tag 'pull-target-arm-20200305'
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200305' into staging (2020-03-05 16:47:37 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf4
>
> for you to fetch changes up to fd990e86a7c99f5c99d430160243a3bcc64b0dea:
>
>   RISC-V: Add a missing "," in riscv_excp_names (2020-03-05 12:01:43 -0800)
>
> ----------------------------------------------------------------
> A single RISC-V fixup
>
> This is just a single patch, which fixes a bug found by Coverity.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

